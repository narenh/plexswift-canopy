import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// The entry point to the Plex API.
///
/// A client is immutable and `Sendable`, so a single instance can be shared across tasks and
/// actors. To change the server or token, make a new client — ``with(server:)`` and
/// ``with(token:)`` return copies.
///
/// ```swift
/// let client = PlexClient(
///     server: .host(scheme: .http, host: "192.168.1.10", port: 32400),
///     token: myToken,
///     identity: ClientIdentity(clientIdentifier: storedIdentifier, product: "My App")
/// )
///
/// let sections = try await client.library.getLibrarySections()
/// ```
///
/// ## Choosing a server
///
/// Unlike the previous generation of this SDK, there is no implicit default server: the address
/// is a required part of constructing a client, and every ``PlexServer`` case resolves to a
/// concrete URL. Use ``PlexServer/localhost`` for a server on the same machine.
///
/// ## Errors
///
/// Operations return the decoded response body and throw ``PlexError`` for everything else, so
/// a non-2xx status is an error rather than a case to switch over. See ``PlexError/APIError``
/// for the status code and body of a failed request.
public final class PlexClient: Sendable {
    /// The configuration this client was built with.
    public let configuration: PlexConfiguration

    private let transport: any HTTPTransport

    /// Creates a client from a full configuration.
    ///
    /// - Parameters:
    ///   - configuration: The server, token and identity to use.
    ///   - transport: The transport requests are sent on. Substitute one in tests, or to wrap
    ///     requests in your own retry or logging behaviour.
    public init(
        configuration: PlexConfiguration,
        transport: any HTTPTransport = URLSessionTransport()
    ) {
        self.configuration = configuration
        self.transport = transport
    }

    /// Creates a client for a server.
    ///
    /// - Parameters:
    ///   - server: The Plex Media Server to talk to.
    ///   - token: The `X-Plex-Token` to authenticate with.
    ///   - identity: How the calling application identifies itself. Required for the OAuth PIN
    ///     flow and JWT device registration.
    ///   - transport: The transport requests are sent on.
    public convenience init(
        server: PlexServer,
        token: String? = nil,
        identity: ClientIdentity? = nil,
        transport: any HTTPTransport = URLSessionTransport()
    ) {
        self.init(
            configuration: PlexConfiguration(server: server, token: token, identity: identity),
            transport: transport
        )
    }

    /// A copy of this client that talks to `server`.
    public func with(server: PlexServer) -> PlexClient {
        var configuration = configuration
        configuration.server = server
        return PlexClient(configuration: configuration, transport: transport)
    }

    /// A copy of this client authenticating with `token`.
    ///
    /// Use this after the OAuth PIN flow returns a token, to upgrade an unauthenticated client.
    public func with(token: String?) -> PlexClient {
        var configuration = configuration
        configuration.token = token
        return PlexClient(configuration: configuration, transport: transport)
    }

    // MARK: - Sending operations

    /// Sends `operation` and returns its decoded body.
    ///
    /// - Throws: ``PlexError``. A non-2xx response throws ``PlexError/api(_:)``.
    @discardableResult
    public func perform<O: PlexOperation>(_ operation: O) async throws(PlexError) -> O.Success {
        try await send(operation).value
    }

    /// Sends `operation` and returns its decoded body along with the response metadata.
    ///
    /// - Throws: ``PlexError``. A non-2xx response throws ``PlexError/api(_:)``.
    public func send<O: PlexOperation>(
        _ operation: O
    ) async throws(PlexError) -> PlexResponse<O.Success> {
        let request = try makeRequest(for: operation)

        let data: Data
        let httpResponse: HTTPURLResponse
        do {
            (data, httpResponse) = try await transport.send(request)
        } catch {
            throw PlexError.transport(error)
        }

        let headers = HTTPHeaders(httpResponse)
        let redactedURL = Self.redactingToken(from: httpResponse.url ?? request.url)

        guard (200...299).contains(httpResponse.statusCode) else {
            throw PlexError.api(
                PlexError.APIError(
                    statusCode: httpResponse.statusCode,
                    operation: O.operationID,
                    url: redactedURL,
                    contentType: headers.contentType,
                    body: data
                )
            )
        }

        let value: O.Success
        do {
            value = try O.decodeSuccess(data, decoder: configuration.decoder)
        } catch {
            throw PlexError.decoding(
                PlexError.DecodingFailure(
                    operation: O.operationID,
                    expectedType: String(describing: O.Success.self),
                    contentType: headers.contentType,
                    body: data,
                    underlyingError: error
                )
            )
        }

        return PlexResponse(
            value: value,
            statusCode: httpResponse.statusCode,
            headers: headers,
            url: redactedURL
        )
    }

    // MARK: - Request construction

    /// Builds the `URLRequest` for `operation` without sending it.
    ///
    /// Exposed so that a caller can hand a fully-authenticated URL to something outside the
    /// SDK — an `AVPlayer` asset, or an image loader — and so the test suite can assert on the
    /// request an operation produces.
    public func makeRequest<O: PlexOperation>(for operation: O) throws(PlexError) -> URLRequest {
        if O.requiresToken, configuration.token == nil {
            throw PlexError.missingToken(operation: O.operationID)
        }
        if O.requiresClientIdentifier, configuration.identity == nil {
            throw PlexError.missingClientIdentifier(operation: O.operationID)
        }

        let baseURL = try O.host.baseURL(mediaServer: configuration.server)
        let url = try Self.url(
            base: baseURL,
            path: operation.path,
            operation: operation,
            configuration: configuration
        )

        var request = URLRequest(url: url)
        request.httpMethod = O.method.rawValue
        request.timeoutInterval = configuration.timeout

        for (name, value) in configuration.baseHeaders() {
            request.setValue(value, forHTTPHeaderField: name)
        }
        for (name, value) in operation.headers {
            request.setValue(value, forHTTPHeaderField: name)
        }

        if O.method.allowsRequestBody {
            let body: RequestBody?
            do {
                body = try operation.body(encoder: configuration.encoder)
            } catch {
                throw PlexError.encoding(operation: O.operationID, underlyingError: error)
            }
            if let body {
                request.httpBody = body.data
                request.setValue(body.contentType, forHTTPHeaderField: "Content-Type")
            }
        }

        return request
    }

    private static func url<O: PlexOperation>(
        base: URL,
        path: String,
        operation: O,
        configuration: PlexConfiguration
    ) throws(PlexError) -> URL {
        // The base URL of a cloud host carries a path prefix (`/api/v2`), so the operation path
        // is appended to it rather than replacing it.
        let combined = base.absoluteString.trimmingTrailingSlash() + path

        guard var components = URLComponents(string: combined) else {
            throw PlexError.invalidURL(combined)
        }

        var items: [URLQueryItem]
        do {
            items = try operation.queryItems
        } catch {
            throw PlexError.encoding(operation: O.operationID, underlyingError: error)
        }
        if case .queryItem = configuration.tokenPlacement, let token = configuration.token {
            items.append(URLQueryItem(name: "X-Plex-Token", value: token))
        }
        components.queryItems = items.isEmpty ? nil : items

        // `URLComponents` escapes `&` and `=` inside a value but leaves `+` alone, and a query
        // parser reading `application/x-www-form-urlencoded` rules decodes `+` as a space. A
        // search for "C++" would otherwise reach Plex as "C  ".
        if let encoded = components.percentEncodedQuery, encoded.contains("+") {
            components.percentEncodedQuery = encoded.replacingOccurrences(of: "+", with: "%2B")
        }

        guard let url = components.url else {
            throw PlexError.invalidURL(combined)
        }
        return url
    }

    /// Replaces the value of any `X-Plex-Token` query item with `REDACTED`.
    ///
    /// Tokens reach URLs when ``TokenPlacement/queryItem`` is in use. Errors and responses are
    /// routinely logged, so the token is stripped before a URL is attached to either.
    static func redactingToken(from url: URL?) -> URL? {
        guard let url,
              var components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let items = components.queryItems,
              items.contains(where: { $0.name == "X-Plex-Token" })
        else { return url }

        components.queryItems = items.map { item in
            item.name == "X-Plex-Token" ? URLQueryItem(name: item.name, value: "REDACTED") : item
        }
        return components.url ?? url
    }
}

extension String {
    func trimmingTrailingSlash() -> String {
        hasSuffix("/") ? String(dropLast()) : self
    }
}
