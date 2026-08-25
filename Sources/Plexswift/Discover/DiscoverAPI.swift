import Foundation

/// Plex Discover: search, hubs, watchlist and title metadata for everything Plex knows about,
/// owned or not.
///
/// Reached through ``PlexClient/discover``.
///
/// ```swift
/// let matches = try await client.discover.search("the matrix", types: [.movies])
/// guard let key = matches.items.first?.ratingKey else { return }
///
/// let item = try await client.discover.metadata(ratingKey: key, including: [.availability])
/// for offer in item?.streamingAvailability ?? [] {
///     print(offer.platform ?? "", offer.offerType ?? "")
/// }
/// ```
///
/// ## What this is, and what it is not
///
/// Everything else in this package is generated from the published specification. These
/// endpoints are not in it. They are what the Plex apps themselves call, they have been stable
/// for years, and they are the only way to reach the things Discover does that a media server
/// cannot — search the whole catalogue, read a streaming-availability list, fetch a season's
/// episodes for a show nobody owns.
///
/// They are also undocumented, and Plex owes nobody notice before changing them. The models
/// this namespace returns are built for that: every property is optional and decoding never
/// throws, so a renamed field or a number that arrives quoted costs one property rather than
/// the whole request. Where a parameter is not named here, `additionalQueryItems` on the
/// underlying operation passes one through.
public struct DiscoverAPI: Sendable {
    let client: PlexClient

    /// The kinds of thing a Discover search can match.
    ///
    /// A struct rather than an enum, so that a type Plex adds — or one this package has not
    /// heard of — can be passed without waiting for a release: `SearchType(rawValue: "…")`.
    public struct SearchType: RawRepresentable, Sendable, Hashable {
        public let rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }

        /// Films.
        public static let movies = SearchType(rawValue: "movies")
        /// Shows, seasons and episodes.
        public static let tv = SearchType(rawValue: "tv")
        /// Cast and crew.
        public static let people = SearchType(rawValue: "people")
        /// Music.
        public static let music = SearchType(rawValue: "music")
    }

    /// Searches Plex's catalogue.
    ///
    /// - Parameters:
    ///   - query: What to search for.
    ///   - types: The kinds of thing to match. Narrowing this makes the search faster and the
    ///     results more useful; the provider searches everything when it is empty.
    ///   - limit: How many results to return.
    ///   - providers: Which catalogues to search. Defaults to `discover`, Plex's own.
    ///   - includeMetadata: Whether each match carries its metadata rather than its identity
    ///     alone. On by default — a search result with no title is rarely of use.
    /// - Returns: The matches, scored and grouped as the provider ranked them.
    @discardableResult
    public func search(
        _ query: String,
        types: [SearchType] = [],
        limit: Int? = nil,
        providers: [String] = ["discover"],
        includeMetadata: Bool = true
    ) async throws(PlexError) -> DiscoverSearchResponse {
        try await client.perform(Operations.DiscoverSearch(
            query: query,
            limit: limit,
            searchTypes: types.isEmpty ? nil : types.map(\.rawValue).joined(separator: ","),
            searchProviders: providers.isEmpty ? nil : providers.joined(separator: ","),
            includeMetadata: includeMetadata
        ))
    }

    /// Fetches the rows that make up a Discover screen.
    ///
    /// Each row arrives with its first few items already in place. A row whose
    /// ``DiscoverHub/more`` is true has further items behind its ``DiscoverHub/key``, which
    /// ``items(path:count:offset:pageSize:queryItems:)`` fetches.
    ///
    /// - Parameters:
    ///   - path: The key to fetch. Defaults to `/hubs`.
    ///   - count: How many items to return in each row.
    ///   - contentDirectoryID: The content directory the rows are drawn from.
    ///   - pinnedContentDirectoryID: The directories pinned to the screen, comma-separated.
    ///   - queryItems: Further query items, for parameters this method does not name.
    @discardableResult
    public func hubs(
        path: String = "/hubs",
        count: Int? = nil,
        contentDirectoryID: String? = nil,
        pinnedContentDirectoryID: String? = nil,
        queryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverHubsResponse {
        try await client.perform(Operations.GetDiscoverHubs(
            key: path,
            count: count,
            contentDirectoryID: contentDirectoryID,
            pinnedContentDirectoryID: pinnedContentDirectoryID,
            additionalQueryItems: queryItems
        ))
    }

    /// Fetches the items behind a Discover key.
    ///
    /// The key comes from the provider — a hub's ``DiscoverHub/key``, a directory's
    /// ``DiscoverDirectory/key``, or a path assembled from one, such as
    /// `/library/people/{tagKey}` for a person's filmography. A key that carries its own query
    /// string keeps it.
    ///
    /// - Parameters:
    ///   - path: The key to fetch.
    ///   - count: How many items to return.
    ///   - offset: Where to start, for paging.
    ///   - pageSize: How many items a page holds.
    ///   - queryItems: Further query items, for parameters this method does not name.
    @discardableResult
    public func items(
        path: String,
        count: Int? = nil,
        offset: Int? = nil,
        pageSize: Int? = nil,
        queryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverItemsResponse {
        try await client.perform(Operations.GetDiscoverItems(
            key: path,
            count: count,
            offset: offset,
            pageSize: pageSize,
            additionalQueryItems: queryItems
        ))
    }

    /// Fetches one title from the metadata provider.
    ///
    /// - Parameters:
    ///   - ratingKey: The provider's key for the title, as returned by a Discover search, hub
    ///     or watchlist. A media server's rating key does not work here.
    ///   - inclusions: Which optional sections to ask for. Each one costs the provider work;
    ///     ``DiscoverMetadataInclusions/standard`` is what a detail screen usually needs.
    ///   - relatedCount: How many titles each related hub should carry.
    /// - Returns: The title, or nil if the provider answered with an empty container.
    @discardableResult
    public func metadata(
        ratingKey: String,
        including inclusions: DiscoverMetadataInclusions = .standard,
        relatedCount: Int? = nil
    ) async throws(PlexError) -> DiscoverMetadata? {
        let response = try await client.perform(Operations.GetDiscoverMetadata(
            ratingKey: ratingKey,
            inclusions: inclusions,
            relatedCount: relatedCount
        ))
        return response.items.first
    }

    /// Fetches a show's seasons, or a season's episodes.
    ///
    /// - Parameters:
    ///   - ratingKey: The provider's key for the show or season.
    ///   - includeUserState: Whether to ask what the account has done with each child.
    @discardableResult
    public func children(
        ratingKey: String,
        includeUserState: Bool? = nil
    ) async throws(PlexError) -> DiscoverItemsResponse {
        try await client.perform(Operations.GetDiscoverMetadataChildren(
            ratingKey: ratingKey,
            includeUserState: includeUserState
        ))
    }

    /// Fetches the account's watchlist.
    ///
    /// - Parameters:
    ///   - filter: Which entries to return: `all`, `available`, or `released`.
    ///   - libtype: Which kind of entry: `movie` or `show`.
    ///   - sort: How to order them, as `field:direction` — `watchlistedAt:desc`.
    ///   - offset: Where to start, for paging.
    ///   - pageSize: How many entries a page holds.
    ///   - inclusions: Which optional sections to ask for on each entry.
    ///
    /// Adding and removing entries are specified operations, at
    /// ``ProviderAPI/addToWatchlist(uri:)`` and ``ProviderAPI/removeFromWatchlist(uri:)``. Both
    /// take the item's ``DiscoverMetadata/guid`` as their `uri`.
    @discardableResult
    public func watchlist(
        filter: String? = nil,
        libtype: String? = nil,
        sort: String? = nil,
        offset: Int? = nil,
        pageSize: Int? = nil,
        including inclusions: DiscoverMetadataInclusions = .none
    ) async throws(PlexError) -> DiscoverItemsResponse {
        try await client.perform(Operations.GetDiscoverWatchlist(
            filter: filter,
            libtype: libtype,
            sort: sort,
            offset: offset,
            pageSize: pageSize,
            inclusions: inclusions
        ))
    }

    // MARK: - Artwork

    /// The URL of a provider artwork path, ready to hand to an image loader.
    ///
    /// Discover returns artwork two ways. ``DiscoverMetadata/image`` holds absolute URLs on
    /// Plex's static host, which need nothing done to them and are returned here unchanged.
    /// ``DiscoverMetadata/thumb`` and ``DiscoverMetadata/art`` are provider-relative paths,
    /// which are resolved against the metadata provider — through its photo transcoder when a
    /// size is asked for, and directly when one is not.
    ///
    /// A transcoded request asks for `minSize` and `upscale`, so the image returned covers the
    /// requested box rather than fitting inside it, which is what a poster grid wants.
    ///
    /// > Important: The token travels in the returned URL's query, because an image loader has
    /// nowhere to put a header. Treat the URL as a credential: it grants what the token grants,
    /// and does not belong in a log or a crash report.
    ///
    /// - Parameters:
    ///   - path: The artwork path, from ``DiscoverMetadata/thumb`` or
    ///     ``DiscoverMetadata/art``.
    ///   - width: The width to transcode to, in pixels.
    ///   - height: The height to transcode to, in pixels.
    /// - Returns: The URL, or nil if `path` is empty or the client has no token to sign the
    ///   request with.
    public func artworkURL(for path: String?, width: Int? = nil, height: Int? = nil) -> URL? {
        guard let path, !path.isEmpty else { return nil }

        if path.hasPrefix("http://") || path.hasPrefix("https://") {
            return URL(string: path)
        }
        guard let token = client.configuration.token else { return nil }

        let host = "https://metadata.provider.plex.tv"
        let credential = URLQueryItem(name: "X-Plex-Token", value: token)

        guard width != nil || height != nil else {
            // The transcoder needs a size to transcode to. Without one, the artwork is fetched
            // as the provider stores it.
            let provider = DiscoverProviderPath(path)
            var components = URLComponents(string: host + provider.path)
            components?.queryItems = provider.queryItems + [credential]
            return components?.url
        }

        var components = URLComponents(string: host + "/photo/:/transcode")
        var items: [URLQueryItem] = []
        if let width {
            items.append(URLQueryItem(name: "width", value: QueryValue(width).encoded))
        }
        if let height {
            items.append(URLQueryItem(name: "height", value: QueryValue(height).encoded))
        }
        items.append(URLQueryItem(name: "minSize", value: "1"))
        items.append(URLQueryItem(name: "upscale", value: "1"))
        items.append(URLQueryItem(name: "url", value: path))
        items.append(credential)
        components?.queryItems = items

        return components?.url
    }
}

extension PlexClient {
    /// Plex Discover: search, hubs, watchlist and title metadata for everything Plex knows
    /// about, owned or not.
    ///
    /// These endpoints are not part of the published specification — see ``DiscoverAPI`` for
    /// what that means for the shape of what they return.
    public var discover: DiscoverAPI { DiscoverAPI(client: self) }
}
