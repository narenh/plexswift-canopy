import Foundation

/// An HTTP method used by a Plex API operation.
public enum HTTPMethod: String, Sendable, Hashable, CaseIterable {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
    case head = "HEAD"
    case options = "OPTIONS"

    /// Whether a request using this method is expected to carry a body.
    ///
    /// Plex accepts bodies on `POST`, `PUT` and `PATCH`. The remaining methods either forbid a
    /// body outright or leave its meaning undefined, so the client never attaches one.
    public var allowsRequestBody: Bool {
        switch self {
        case .post, .put, .patch:
            return true
        case .get, .delete, .head, .options:
            return false
        }
    }
}
