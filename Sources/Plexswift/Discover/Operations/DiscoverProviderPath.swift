import Foundation

/// A path into a provider's tree, taken apart into the pieces a request needs.
///
/// Discover is walked by following keys the provider hands back — a hub's `key`, a directory's
/// `key` — rather than by assembling paths from documented templates. Those keys are not
/// uniform: some start with a slash and some do not, and some already carry a query string
/// (`/library/sections/watchlist/all?type=1`). Passing one through unexamined would either
/// produce a doubled slash or bury the query inside the path, so every operation that takes a
/// key runs it through here first.
struct DiscoverProviderPath: Sendable, Hashable {
    /// The path, with a leading slash and no query.
    let path: String
    /// The query items the key carried, if any.
    let queryItems: [URLQueryItem]

    init(_ key: String) {
        let trimmed = key.trimmingCharacters(in: .whitespacesAndNewlines)
        let components = URLComponents(string: trimmed)
        let rawPath = components?.path ?? trimmed.components(separatedBy: "?").first ?? trimmed

        path = rawPath.hasPrefix("/") ? rawPath : "/" + rawPath
        queryItems = components?.queryItems ?? []
    }

    /// The key's own query items followed by `additional`, with any duplicate of a name the key
    /// already set dropped.
    ///
    /// The key wins because it came from the provider: a hub key that pins `type=2` means it,
    /// and a default supplied here should not quietly override it.
    func queryItems(merging additional: [URLQueryItem]) -> [URLQueryItem] {
        let existing = Set(queryItems.map(\.name))
        return queryItems + additional.filter { !existing.contains($0.name) }
    }
}
