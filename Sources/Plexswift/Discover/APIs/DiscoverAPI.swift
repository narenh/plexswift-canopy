import Foundation

/// The `Discover` operations of the Plex API.
///
/// Reached through ``PlexClient/discover``.
///
/// Discover is the part of Plex that knows about titles independently of any server: the
/// catalogue behind the search field, the rows on a Discover screen, the account's watchlist,
/// and the one thing a media server cannot answer at all — which services a title is currently
/// streaming on, and for how much. Two hosts serve it, `discover.provider.plex.tv` and
/// `metadata.provider.plex.tv`, and each operation declares which one it belongs to.
///
/// ```swift
/// let matches = try await client.discover.searchDiscoverProvider(query: "severance")
/// guard let key = matches.mediaContainer?.results.first?.metadata?.ratingKey else { return }
///
/// let details = try await client.discover.getDiscoverMetadata(
///     ratingKey: key,
///     includeAvailability: true
/// )
/// for offer in details.mediaContainer?.metadata?.first?.availability ?? [] {
///     print(offer.title ?? "", offer.offerType ?? "")
/// }
/// ```
///
/// ## Not from the specification
///
/// Every other namespace in this package is generated from the published Plex specification.
/// These endpoints are not in it: they are what the Plex apps themselves call, and they have
/// been stable for years, but Plex owes nobody notice before changing them.
///
/// The models they return are built for that — every property optional, decoding non-throwing,
/// see <doc:PlexDiscover> — and every operation takes `additionalQueryItems`, so a parameter
/// this package does not name can still be sent.
public struct DiscoverAPI: Sendable {
    let client: PlexClient

    /// Search movies and shows in Plex Discover.
    ///
    /// The specification describes this endpoint as ``ProviderAPI/searchDiscover(query:limit:searchTypes:searchProviders:includeMetadata:)``,
    /// but types its response as a plain metadata container where the provider answers with
    /// scored results grouped by source — so the generated method decodes to an empty container
    /// even when there were matches. This one decodes what the provider sends.
    @discardableResult
    public func searchDiscoverProvider(
        query: String,
        limit: Int? = nil,
        searchTypes: String? = nil,
        searchProviders: String? = nil,
        includeMetadata: Bool? = nil,
        additionalQueryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverSearchResponse {
        try await client.perform(Operations.SearchDiscoverProvider(
            query: query,
            limit: limit,
            searchTypes: searchTypes,
            searchProviders: searchProviders,
            includeMetadata: includeMetadata,
            additionalQueryItems: additionalQueryItems
        ))
    }

    /// Get a set of Discover hubs — the rows that make up a Discover screen.
    ///
    /// Each row arrives with its first few items already in place. A row whose
    /// ``DiscoverHub/more`` is true has further items behind its ``DiscoverHub/key``, which
    /// ``getDiscoverItems(key:count:containerStart:containerSize:additionalQueryItems:)``
    /// fetches.
    @discardableResult
    public func getDiscoverHubs(
        key: String = "/hubs",
        count: Int? = nil,
        contentDirectoryID: String? = nil,
        pinnedContentDirectoryID: String? = nil,
        additionalQueryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverHubsResponse {
        try await client.perform(Operations.GetDiscoverHubs(
            key: key,
            count: count,
            contentDirectoryID: contentDirectoryID,
            pinnedContentDirectoryID: pinnedContentDirectoryID,
            additionalQueryItems: additionalQueryItems
        ))
    }

    /// Get the items behind a Discover key: a hub's contents, a directory's listing, a person's
    /// filmography.
    ///
    /// The key comes from the provider — a hub's ``DiscoverHub/key``, a directory's
    /// ``DiscoverDirectory/key``, or a path built from one, such as
    /// `/library/people/{tagKey}`. A key that carries its own query string keeps it.
    @discardableResult
    public func getDiscoverItems(
        key: String,
        count: Int? = nil,
        containerStart: Int? = nil,
        containerSize: Int? = nil,
        additionalQueryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverItemsResponse {
        try await client.perform(Operations.GetDiscoverItems(
            key: key,
            count: count,
            containerStart: containerStart,
            containerSize: containerSize,
            additionalQueryItems: additionalQueryItems
        ))
    }

    /// Get everything the metadata provider knows about one title.
    ///
    /// The rating key is the provider's, as returned by a Discover search, hub or watchlist. A
    /// media server's rating key does not work here.
    ///
    /// Without an `include` flag the response is little more than the title, artwork and a
    /// synopsis; each flag costs the provider work, so ask for what the screen shows.
    @discardableResult
    public func getDiscoverMetadata(
        ratingKey: String,
        includeUserState: Bool? = nil,
        includeReviews: Bool? = nil,
        includeExtras: Bool? = nil,
        includeChildren: Bool? = nil,
        includeRelated: Bool? = nil,
        includeRelatedCount: Int? = nil,
        includeOnDeck: Bool? = nil,
        includeAvailability: Bool? = nil,
        includeExternalMedia: Bool? = nil,
        asyncAugmentMetadata: Bool? = nil,
        additionalQueryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverItemsResponse {
        try await client.perform(Operations.GetDiscoverMetadata(
            ratingKey: ratingKey,
            includeUserState: includeUserState,
            includeReviews: includeReviews,
            includeExtras: includeExtras,
            includeChildren: includeChildren,
            includeRelated: includeRelated,
            includeRelatedCount: includeRelatedCount,
            includeOnDeck: includeOnDeck,
            includeAvailability: includeAvailability,
            includeExternalMedia: includeExternalMedia,
            asyncAugmentMetadata: asyncAugmentMetadata,
            additionalQueryItems: additionalQueryItems
        ))
    }

    /// Get a show's seasons, or a season's episodes, from the metadata provider.
    @discardableResult
    public func getDiscoverMetadataChildren(
        ratingKey: String,
        includeUserState: Bool? = nil,
        additionalQueryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverItemsResponse {
        try await client.perform(Operations.GetDiscoverMetadataChildren(
            ratingKey: ratingKey,
            includeUserState: includeUserState,
            additionalQueryItems: additionalQueryItems
        ))
    }

    /// Get the account's Plex Discover watchlist.
    ///
    /// Adding and removing entries are specified operations, at
    /// ``ProviderAPI/addToWatchlist(uri:)`` and ``ProviderAPI/removeFromWatchlist(uri:)``. Both
    /// take the item's ``DiscoverMetadata/guid`` as their `uri`.
    @discardableResult
    public func getDiscoverWatchlist(
        filter: String? = nil,
        libtype: String? = nil,
        sort: String? = nil,
        containerStart: Int? = nil,
        containerSize: Int? = nil,
        additionalQueryItems: [URLQueryItem] = []
    ) async throws(PlexError) -> DiscoverItemsResponse {
        try await client.perform(Operations.GetDiscoverWatchlist(
            filter: filter,
            libtype: libtype,
            sort: sort,
            containerStart: containerStart,
            containerSize: containerSize,
            additionalQueryItems: additionalQueryItems
        ))
    }

    /// Transcode an image held by the metadata provider, possibly changing format or size.
    ///
    /// For a URL to hand to an image loader rather than the bytes themselves, build the request
    /// without sending it — see ``Operations/TranscodeDiscoverImage``.
    @discardableResult
    public func transcodeDiscoverImage(
        url: String? = nil,
        format: TranscodeImageFormat? = nil,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil,
        upscale: BoolInt? = nil,
        minSize: BoolInt? = nil,
        blur: Int? = nil,
        saturation: Int? = nil,
        opacity: Int? = nil,
        chromaSubsampling: TranscodeImageChromaSubsampling? = nil,
        background: String? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.TranscodeDiscoverImage(
            url: url,
            format: format,
            width: width,
            height: height,
            quality: quality,
            upscale: upscale,
            minSize: minSize,
            blur: blur,
            saturation: saturation,
            opacity: opacity,
            chromaSubsampling: chromaSubsampling,
            background: background
        ))
    }
}

extension PlexClient {
    /// The `Discover` operations of the Plex API.
    ///
    /// Unlike every other namespace, these are not generated: the specification does not
    /// describe them. See ``DiscoverAPI`` and <doc:PlexDiscover>.
    public var discover: DiscoverAPI { DiscoverAPI(client: self) }
}
