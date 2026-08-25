import Foundation

/// The headers Plex pages a container with.
///
/// Paging on these endpoints is not a query parameter: the request asks for a window with
/// `X-Plex-Container-Start` and `X-Plex-Container-Size`, and the response reports the total in
/// `X-Plex-Container-Total-Size`. Two operations need to say that, so they say it here.
struct DiscoverContainerPaging: Sendable, Hashable {
    /// Where the returned page starts.
    let start: Int?
    /// How many items the page holds.
    let size: Int?

    /// The headers this window contributes to a request, empty when no window was asked for.
    var headers: [String: String] {
        var headers: [String: String] = [:]
        if let start {
            headers["X-Plex-Container-Start"] = QueryValue(start).encoded
        }
        if let size {
            headers["X-Plex-Container-Size"] = QueryValue(size).encoded
        }
        return headers
    }
}
