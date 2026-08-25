import Foundation

/// A single Plex API operation.
///
/// Every generated operation is a value type conforming to this protocol. Because an operation
/// is just data — it describes a request rather than performing one — it can be constructed and
/// inspected without a network, which is what the test suite does.
public protocol PlexOperation: Sendable {
    /// The type the successful response body decodes to.
    ///
    /// Use ``EmptyResponse`` for operations that return no content, and `Data` for operations
    /// that return binary payloads such as images.
    associatedtype Success: Sendable

    /// The `operationId` from the specification. Used to identify the operation in errors.
    static var operationID: String { get }

    /// The HTTP method.
    static var method: HTTPMethod { get }

    /// Which host the operation is addressed to.
    static var host: OperationHost { get }

    /// Whether the operation requires an `X-Plex-Token`.
    static var requiresToken: Bool { get }

    /// Whether the operation requires an `X-Plex-Client-Identifier`.
    static var requiresClientIdentifier: Bool { get }

    /// The path, with any path parameters already substituted and percent-encoded.
    var path: String { get }

    /// Query items for the request, in specification order.
    ///
    /// Throwing, because an object-valued parameter has to be encoded to be expanded into
    /// query items. Operations whose parameters are all scalars do not throw.
    var queryItems: [URLQueryItem] { get throws }

    /// Headers specific to this operation, applied over the client's base headers.
    var headers: [String: String] { get }

    /// The request body, if any.
    func body(encoder: JSONEncoder) throws -> RequestBody?

    /// Decodes a successful response body.
    static func decodeSuccess(_ data: Data, decoder: JSONDecoder) throws -> Success
}

extension PlexOperation {
    public static var requiresToken: Bool { true }
    public static var requiresClientIdentifier: Bool { false }
    public static var host: OperationHost { .mediaServer }
    public var queryItems: [URLQueryItem] { [] }
    public var headers: [String: String] { [:] }
    public func body(encoder: JSONEncoder) throws -> RequestBody? { nil }
}

extension PlexOperation where Success: Decodable {
    public static func decodeSuccess(_ data: Data, decoder: JSONDecoder) throws -> Success {
        try decoder.decode(Success.self, from: data)
    }
}

extension PlexOperation where Success == Data {
    public static func decodeSuccess(_ data: Data, decoder: JSONDecoder) throws -> Data {
        data
    }
}

extension PlexOperation where Success == String {
    /// Decodes a textual response body.
    ///
    /// Used by the operations whose successful response is XML or plain text rather than JSON —
    /// the legacy plex.tv endpoints, mostly. This overload is more specialised than the
    /// `Success: Decodable` one, so it wins: without it a `String` body would be handed to
    /// `JSONDecoder`, which would reject anything that is not a quoted JSON string.
    public static func decodeSuccess(_ data: Data, decoder: JSONDecoder) throws -> String {
        guard let text = String(data: data, encoding: .utf8) else {
            throw ResponseDecodingError.notValidUTF8
        }
        return text
    }
}

/// Failures raised while turning a response body into an operation's `Success` type.
public enum ResponseDecodingError: Swift.Error, Sendable {
    /// The body was expected to be text but is not valid UTF-8.
    case notValidUTF8
}

extension PlexOperation where Success == EmptyResponse {
    public static func decodeSuccess(_ data: Data, decoder: JSONDecoder) throws -> EmptyResponse {
        EmptyResponse()
    }
}

/// The response of an operation that returns no content.
public struct EmptyResponse: Sendable, Hashable {
    public init() {}
}

/// The body of a request, together with the `Content-Type` describing it.
public struct RequestBody: Sendable, Hashable {
    /// The encoded bytes.
    public let data: Data
    /// The value of the `Content-Type` header.
    public let contentType: String

    public init(data: Data, contentType: String) {
        self.data = data
        self.contentType = contentType
    }

    /// A JSON body encoded from `value`.
    public static func json(_ value: some Encodable, encoder: JSONEncoder) throws -> RequestBody {
        RequestBody(data: try encoder.encode(value), contentType: "application/json")
    }

    /// A `application/x-www-form-urlencoded` body.
    public static func form(_ items: [URLQueryItem]) -> RequestBody {
        var components = URLComponents()
        components.queryItems = items
        let encoded = (components.percentEncodedQuery ?? "")
            // `URLComponents` leaves `+` unescaped, where a form decoder reads it as a space.
            .replacingOccurrences(of: "+", with: "%2B")
        return RequestBody(
            data: Data(encoded.utf8),
            contentType: "application/x-www-form-urlencoded"
        )
    }

    /// A `text/plain` body.
    public static func text(_ value: String) -> RequestBody {
        RequestBody(data: Data(value.utf8), contentType: "text/plain; charset=utf-8")
    }

    /// A `multipart/form-data` body carrying a single file part.
    ///
    /// Used by the image upload operations, which declare a multipart body with one binary
    /// field. The boundary is derived from a UUID so it cannot occur in the payload.
    public static func multipart(
        fieldName: String,
        data: Data,
        filename: String = "upload",
        contentType: String = "application/octet-stream",
        boundary: String = "PlexswiftBoundary-\(UUID().uuidString)"
    ) -> RequestBody {
        var body = Data()
        body.append(Data("--\(boundary)\r\n".utf8))
        body.append(
            Data(
                """
                Content-Disposition: form-data; name="\(fieldName)"; filename="\(filename)"\r
                Content-Type: \(contentType)\r
                \r

                """.utf8
            )
        )
        body.append(data)
        body.append(Data("\r\n--\(boundary)--\r\n".utf8))

        return RequestBody(
            data: body,
            contentType: "multipart/form-data; boundary=\(boundary)"
        )
    }
}
