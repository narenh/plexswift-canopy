import Foundation

/// Every error surfaced by ``PlexClient``.
///
/// The cases split by *where* the request failed, so that callers can react without
/// string-matching: configuration problems are programmer errors, ``transport(_:)`` wraps
/// connectivity failures worth retrying, and ``api(_:)`` carries a real response from Plex.
public enum PlexError: Swift.Error, Sendable {
    /// The configured server, or an operation's path, could not be turned into a valid URL.
    case invalidURL(String)

    /// The operation requires an authentication token but the client was configured without one.
    case missingToken(operation: String)

    /// The operation requires an `X-Plex-Client-Identifier` but the client was configured
    /// without a ``ClientIdentity``.
    case missingClientIdentifier(operation: String)

    /// The request never produced an HTTP response — DNS failure, connection refused, TLS
    /// failure, timeout. The associated value is the underlying `URLSession` error.
    case transport(any Swift.Error)

    /// Plex returned a response outside the 2xx range.
    case api(APIError)

    /// A 2xx response arrived but its body could not be decoded into the expected type.
    case decoding(DecodingFailure)

    /// Details of a non-2xx response from Plex.
    public struct APIError: Swift.Error, Sendable, CustomStringConvertible {
        /// The HTTP status code.
        public let statusCode: Int
        /// The `operationId` of the operation that failed.
        public let operation: String
        /// The URL that was requested, with any `X-Plex-Token` query item redacted.
        public let url: URL?
        /// The `Content-Type` of the error body, if the response declared one.
        public let contentType: String?
        /// The raw response body.
        public let body: Data

        public init(
            statusCode: Int,
            operation: String,
            url: URL?,
            contentType: String?,
            body: Data
        ) {
            self.statusCode = statusCode
            self.operation = operation
            self.url = url
            self.contentType = contentType
            self.body = body
        }

        /// The response body decoded as UTF-8, when it is textual.
        ///
        /// Plex reports most errors as `text/html` or `text/plain`, so this is usually the
        /// useful part of the response.
        public var bodyText: String? {
            String(data: body, encoding: .utf8)
        }

        /// Whether retrying the request unchanged could plausibly succeed.
        ///
        /// `429` and the 5xx range are transient. Everything else reflects the request itself
        /// and will fail the same way again.
        public var isRetryable: Bool {
            statusCode == 429 || (500...599).contains(statusCode)
        }

        /// Whether the request failed because the token was missing, invalid or expired.
        public var isAuthenticationFailure: Bool {
            statusCode == 401 || statusCode == 403
        }

        public var description: String {
            var text = "\(operation) failed with HTTP \(statusCode)"
            if let url {
                text += " for \(url.absoluteString)"
            }
            if let bodyText, !bodyText.isEmpty {
                text += ": \(bodyText.prefix(512))"
            }
            return text
        }
    }

    /// Details of a response body that could not be decoded.
    public struct DecodingFailure: Swift.Error, Sendable, CustomStringConvertible {
        /// The `operationId` of the operation whose response could not be decoded.
        public let operation: String
        /// The Swift type the body was being decoded into.
        public let expectedType: String
        /// The `Content-Type` the response declared, if any.
        public let contentType: String?
        /// The raw response body.
        public let body: Data
        /// The underlying `DecodingError`, when the failure came from `JSONDecoder`.
        public let underlyingError: (any Swift.Error)?

        public init(
            operation: String,
            expectedType: String,
            contentType: String?,
            body: Data,
            underlyingError: (any Swift.Error)?
        ) {
            self.operation = operation
            self.expectedType = expectedType
            self.contentType = contentType
            self.body = body
            self.underlyingError = underlyingError
        }

        public var description: String {
            var text = "Could not decode the response to \(operation) as \(expectedType)"
            if let contentType {
                text += " (Content-Type: \(contentType))"
            }
            if let underlyingError {
                text += ": \(underlyingError)"
            }
            return text
        }
    }
}

extension PlexError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidURL(let string):
            return "'\(string)' is not a valid URL"
        case .missingToken(let operation):
            return "\(operation) requires an X-Plex-Token, but the client has no token configured"
        case .missingClientIdentifier(let operation):
            return "\(operation) requires an X-Plex-Client-Identifier, but the client has no identity configured"
        case .transport(let error):
            return "The request could not be sent: \(error)"
        case .api(let error):
            return error.description
        case .decoding(let failure):
            return failure.description
        }
    }
}

extension PlexError: LocalizedError {
    public var errorDescription: String? { description }
}
