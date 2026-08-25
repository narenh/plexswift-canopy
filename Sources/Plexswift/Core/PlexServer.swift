import Foundation

/// The address of the Plex Media Server a ``PlexClient`` talks to.
///
/// The OpenAPI specification models the server block as three URL templates. Each case here
/// corresponds to one of them, but unlike a raw template every case can always produce a
/// concrete URL — there is no way to construct a ``PlexServer`` that resolves to an
/// unsubstituted `{protocol}://{host}:{port}` string.
public enum PlexServer: Sendable, Hashable {
    /// A direct connection over `plex.direct`, the scheme Plex uses to serve a valid TLS
    /// certificate for an address that is otherwise an bare IP.
    ///
    /// - Parameters:
    ///   - address: The IPv4 or IPv6 address of the server with `.` or `:` replaced by `-`,
    ///     for example `1-2-3-4`. Use ``plexDirect(address:identifier:port:)`` with an
    ///     already-hyphenated string, or ``plexDirect(ip:identifier:port:)`` to have the
    ///     conversion done for you.
    ///   - identifier: The machine identifier of the server.
    ///   - port: The port the server listens on.
    case plexDirect(address: String, identifier: String, port: Int)

    /// A connection to a host and port, for example a server on the local network or behind a
    /// reverse proxy.
    case host(scheme: URLScheme, host: String, port: Int)

    /// A fully-formed base URL, for when none of the templates fit.
    case url(URL)

    /// The scheme used by ``PlexServer/host(scheme:host:port:)``.
    public enum URLScheme: String, Sendable, Hashable, CaseIterable {
        case http
        case https
    }

    /// The conventional Plex Media Server port.
    public static let defaultPort = 32400

    /// A server reachable at `http://localhost:32400`, the default for a server running on the
    /// same machine as the client.
    public static let localhost = PlexServer.host(scheme: .http, host: "localhost", port: defaultPort)

    /// Builds a `plex.direct` server from an unmodified IP address.
    ///
    /// `plex.direct` certificates encode the address with its separators replaced by `-`, so
    /// `10.0.0.5` becomes `10-0-0-5`. This performs that substitution for both IPv4 and IPv6.
    public static func plexDirect(ip: String, identifier: String, port: Int = defaultPort) -> PlexServer {
        let address = ip.replacingOccurrences(of: ".", with: "-")
            .replacingOccurrences(of: ":", with: "-")
        return .plexDirect(address: address, identifier: identifier, port: port)
    }

    /// The base URL for this server.
    ///
    /// - Throws: ``PlexError/invalidURL(_:)`` if the components do not form a valid URL, which
    ///   can happen if a host or identifier contains characters that are illegal in a URL.
    public func baseURL() throws -> URL {
        switch self {
        case .plexDirect(let address, let identifier, let port):
            return try Self.url(from: "https://\(address).\(identifier).plex.direct:\(port)")
        case .host(let scheme, let host, let port):
            return try Self.url(from: "\(scheme.rawValue)://\(host):\(port)")
        case .url(let url):
            return url
        }
    }

    private static func url(from string: String) throws -> URL {
        guard let url = URL(string: string), url.host != nil else {
            throw PlexError.invalidURL(string)
        }
        return url
    }
}

/// A host that an operation is addressed to.
///
/// Most operations target the user's own Plex Media Server. Authentication, account and social
/// endpoints instead target one of Plex's cloud hosts, which the specification pins as an
/// absolute URL on the operation.
public enum OperationHost: Sendable, Hashable {
    /// The Plex Media Server configured on the client.
    case mediaServer
    /// A fixed cloud host, declared by the operation's `servers` override.
    case absolute(String)

    /// `https://plex.tv/api/v2` — authentication, account, devices, and social endpoints.
    public static let plexTVv2 = OperationHost.absolute("https://plex.tv/api/v2")
    /// `https://plex.tv/api` — legacy XML endpoints for friends, home users and claims.
    public static let plexTVv1 = OperationHost.absolute("https://plex.tv/api")
    /// `https://plex.tv` — endpoints served from the site root.
    public static let plexTV = OperationHost.absolute("https://plex.tv")
    /// `https://discover.provider.plex.tv` — the Discover metadata provider.
    public static let discoverProvider = OperationHost.absolute("https://discover.provider.plex.tv")
    /// `https://clients.plex.tv/api/v2` — client-facing companion endpoints.
    public static let clientsPlexTV = OperationHost.absolute("https://clients.plex.tv/api/v2")

    /// Resolves this host against the client's configured server.
    func baseURL(mediaServer: PlexServer) throws -> URL {
        switch self {
        case .mediaServer:
            return try mediaServer.baseURL()
        case .absolute(let string):
            guard let url = URL(string: string) else { throw PlexError.invalidURL(string) }
            return url
        }
    }
}
