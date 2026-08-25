import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// A successful response, with the decoded value and the HTTP metadata that came with it.
///
/// The convenience methods on the API namespaces return the decoded value directly, since that
/// is what callers almost always want. Use ``PlexClient/send(_:)`` when you also need the
/// status code or headers — for example to read `X-Plex-Protocol` or a rate-limit header.
public struct PlexResponse<Value: Sendable>: Sendable {
    /// The decoded response body.
    public let value: Value
    /// The HTTP status code, always in the 2xx range.
    public let statusCode: Int
    /// The response headers, keyed case-insensitively.
    public let headers: HTTPHeaders
    /// The URL that produced this response, with any `X-Plex-Token` query item redacted.
    public let url: URL?

    public init(value: Value, statusCode: Int, headers: HTTPHeaders, url: URL?) {
        self.value = value
        self.statusCode = statusCode
        self.headers = headers
        self.url = url
    }

    /// Returns a response carrying the result of applying `transform` to ``value``.
    public func map<T: Sendable>(_ transform: (Value) throws -> T) rethrows -> PlexResponse<T> {
        PlexResponse<T>(
            value: try transform(value),
            statusCode: statusCode,
            headers: headers,
            url: url
        )
    }
}

/// A case-insensitive view over HTTP response headers.
///
/// HTTP header names are case-insensitive, but `HTTPURLResponse.allHeaderFields` preserves
/// whatever casing the server sent, so looking up `"content-type"` may miss a `Content-Type`
/// header. This normalises lookups.
public struct HTTPHeaders: Sendable, Hashable {
    private var storage: [String: String]

    public init(_ fields: [String: String] = [:]) {
        storage = Dictionary(
            fields.map { ($0.key.lowercased(), $0.value) },
            uniquingKeysWith: { _, new in new }
        )
    }

    init(_ response: HTTPURLResponse) {
        let fields = response.allHeaderFields.compactMap { key, value -> (String, String)? in
            guard let name = key as? String else { return nil }
            return (name, String(describing: value))
        }
        self.init(Dictionary(fields, uniquingKeysWith: { _, new in new }))
    }

    /// The value of `name`, matched without regard to case.
    public subscript(name: String) -> String? {
        get { storage[name.lowercased()] }
        set { storage[name.lowercased()] = newValue }
    }

    /// The header names, lowercased.
    public var names: [String] { Array(storage.keys) }

    /// The `Content-Type` header with any parameters (such as `; charset=utf-8`) removed.
    public var contentType: String? {
        self["Content-Type"]?
            .split(separator: ";", maxSplits: 1)
            .first
            .map { $0.trimmingCharacters(in: .whitespaces).lowercased() }
    }
}
