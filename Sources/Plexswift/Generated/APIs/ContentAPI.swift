// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Content` operations of the Plex API.
///
/// Reached through ``PlexClient/content``.
public struct ContentAPI: Sendable {
    let client: PlexClient

    /// Get all albums in a music section
    @discardableResult
    public func getAlbums(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetAlbums(
            sectionId: sectionId
        ))
    }

    /// Get all leaves in a section (such as episodes in a show section)
    @discardableResult
    public func getAllLeaves(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetAllLeaves(
            sectionId: sectionId
        ))
    }

    /// Get artwork for a library section
    @discardableResult
    public func getArts(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithArtwork {
        try await client.perform(Operations.GetArts(
            sectionId: sectionId
        ))
    }

    /// Get categories in a library section
    @discardableResult
    public func getCategories(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithArtwork {
        try await client.perform(Operations.GetCategories(
            sectionId: sectionId
        ))
    }

    /// Get clusters in a library section (typically for photos)
    @discardableResult
    public func getCluster(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithArtwork {
        try await client.perform(Operations.GetCluster(
            sectionId: sectionId
        ))
    }

    /// Get an image for the collection based on the items within
    @discardableResult
    public func getCollectionImage(
        composite: GetCollectionImageComposite? = nil,
        collectionId: Int,
        updatedAt: Int
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetCollectionImage(
            composite: composite,
            collectionId: collectionId,
            updatedAt: updatedAt
        ))
    }

    /// Get items in a collection. Note if this collection contains more than 100 items, paging must be
    /// used.
    @discardableResult
    public func getCollectionItems(
        collectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetCollectionItems(
            collectionId: collectionId
        ))
    }

    /// Get all folder locations of the media in a section
    @discardableResult
    public func getFolders(
        sectionId: Int
    ) async throws(PlexError) -> GetFoldersResponse {
        try await client.perform(Operations.GetFolders(
            sectionId: sectionId
        ))
    }

    /// Get one or more metadata items.
    @discardableResult
    public func getMetadataItem(
        ids: [String],
        asyncCheckFiles: BoolInt? = nil,
        asyncRefreshLocalMediaAgent: BoolInt? = nil,
        asyncRefreshAnalysis: BoolInt? = nil,
        checkFiles: BoolInt? = nil,
        skipRefresh: BoolInt? = nil,
        checkFileAvailability: BoolInt? = nil,
        asyncAugmentMetadata: BoolInt? = nil,
        augmentCount: BoolInt? = nil,
        includeMarkers: Bool? = nil,
        includeGuids: Bool? = nil,
        includeChapters: Bool? = nil,
        includeExternalMedia: Bool? = nil,
        includeExtras: Bool? = nil,
        includeRelated: Bool? = nil,
        includeOnDeck: Bool? = nil,
        includePopularLeaves: Bool? = nil,
        includeReviews: Bool? = nil,
        includeStations: Bool? = nil,
        excludeElements: String? = nil,
        excludeFields: String? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetMetadataItem(
            ids: ids,
            asyncCheckFiles: asyncCheckFiles,
            asyncRefreshLocalMediaAgent: asyncRefreshLocalMediaAgent,
            asyncRefreshAnalysis: asyncRefreshAnalysis,
            checkFiles: checkFiles,
            skipRefresh: skipRefresh,
            checkFileAvailability: checkFileAvailability,
            asyncAugmentMetadata: asyncAugmentMetadata,
            augmentCount: augmentCount,
            includeMarkers: includeMarkers,
            includeGuids: includeGuids,
            includeChapters: includeChapters,
            includeExternalMedia: includeExternalMedia,
            includeExtras: includeExtras,
            includeRelated: includeRelated,
            includeOnDeck: includeOnDeck,
            includePopularLeaves: includePopularLeaves,
            includeReviews: includeReviews,
            includeStations: includeStations,
            excludeElements: excludeElements,
            excludeFields: excludeFields
        ))
    }

    /// Get a list of audio tracks starting at one and ending at another which are similar across the
    /// path
    @discardableResult
    public func getSonicPath(
        count: Int? = nil,
        sectionId: Int,
        startID: Int,
        endID: Int,
        maxDistance: Double? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSonicPath(
            count: count,
            sectionId: sectionId,
            startID: startID,
            endID: endID,
            maxDistance: maxDistance
        ))
    }

    /// Get the nearest audio tracks to a particular analysis
    @discardableResult
    public func getSonicallySimilar(
        sectionId: Int,
        type: Int? = nil,
        values: [Int],
        limit: Int? = nil,
        maxDistance: Double? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSonicallySimilar(
            sectionId: sectionId,
            type: type,
            values: values,
            limit: limit,
            maxDistance: maxDistance
        ))
    }

    /// Get the items in a section, potentially filtering them.
    /// When `includeCollections=1` is passed, the response may also contain `Collection` items.
    @discardableResult
    public func listContent(
        xPlexContainerStart: Int? = nil,
        xPlexContainerSize: Int? = nil,
        mediaQuery: MediaQuery? = nil,
        sectionId: Int,
        includeMeta: BoolInt? = nil,
        includeGuids: BoolInt? = nil,
        includeCollections: BoolInt? = nil,
        includeExternalMedia: BoolInt? = nil,
        includeAdvanced: BoolInt? = nil,
        checkFiles: BoolInt? = nil,
        includeRelated: BoolInt? = nil,
        includeExtras: BoolInt? = nil,
        includePopularLeaves: BoolInt? = nil,
        includeConcerts: BoolInt? = nil,
        includeOnDeck: BoolInt? = nil,
        includeChapters: BoolInt? = nil,
        includePreferences: BoolInt? = nil,
        includeBandwidths: BoolInt? = nil,
        includeLoudnessRamps: BoolInt? = nil,
        includeStations: BoolInt? = nil,
        includeExternalIds: BoolInt? = nil,
        includeReviews: BoolInt? = nil,
        includeCredits: BoolInt? = nil,
        includeArt: BoolInt? = nil,
        includeThumb: BoolInt? = nil,
        includeBanner: BoolInt? = nil,
        includeTheme: BoolInt? = nil,
        includeFields: String? = nil,
        excludeFields: String? = nil,
        asyncAugmentMetadata: BoolInt? = nil,
        asyncRefreshLocalMediaAgent: BoolInt? = nil,
        nocache: BoolInt? = nil,
        skipRefresh: BoolInt? = nil,
        excludeElements: String? = nil,
        filters: String? = nil,
        unwatched: BoolInt? = nil,
        genre: String? = nil,
        studio: String? = nil,
        contentRating: String? = nil,
        resolution: String? = nil,
        year: Int? = nil,
        firstCharacter: String? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.ListContent(
            xPlexContainerStart: xPlexContainerStart,
            xPlexContainerSize: xPlexContainerSize,
            mediaQuery: mediaQuery,
            sectionId: sectionId,
            includeMeta: includeMeta,
            includeGuids: includeGuids,
            includeCollections: includeCollections,
            includeExternalMedia: includeExternalMedia,
            includeAdvanced: includeAdvanced,
            checkFiles: checkFiles,
            includeRelated: includeRelated,
            includeExtras: includeExtras,
            includePopularLeaves: includePopularLeaves,
            includeConcerts: includeConcerts,
            includeOnDeck: includeOnDeck,
            includeChapters: includeChapters,
            includePreferences: includePreferences,
            includeBandwidths: includeBandwidths,
            includeLoudnessRamps: includeLoudnessRamps,
            includeStations: includeStations,
            includeExternalIds: includeExternalIds,
            includeReviews: includeReviews,
            includeCredits: includeCredits,
            includeArt: includeArt,
            includeThumb: includeThumb,
            includeBanner: includeBanner,
            includeTheme: includeTheme,
            includeFields: includeFields,
            excludeFields: excludeFields,
            asyncAugmentMetadata: asyncAugmentMetadata,
            asyncRefreshLocalMediaAgent: asyncRefreshLocalMediaAgent,
            nocache: nocache,
            skipRefresh: skipRefresh,
            excludeElements: excludeElements,
            filters: filters,
            unwatched: unwatched,
            genre: genre,
            studio: studio,
            contentRating: contentRating,
            resolution: resolution,
            year: year,
            firstCharacter: firstCharacter
        ))
    }

    /// Get moments in a library section (typically for photos)
    @discardableResult
    public func listMoments(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithArtwork {
        try await client.perform(Operations.ListMoments(
            sectionId: sectionId
        ))
    }
}

extension PlexClient {
    /// The `Content` operations of the Plex API.
    public var content: ContentAPI { ContentAPI(client: self) }
}
