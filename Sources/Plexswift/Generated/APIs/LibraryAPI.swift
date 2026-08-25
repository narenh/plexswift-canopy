// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Library` operations of the Plex API.
///
/// Reached through ``PlexClient/library``.
public struct LibraryAPI: Sendable {
    let client: PlexClient

    /// Add an extra to a metadata item
    @discardableResult
    public func addExtras(
        title: String? = nil,
        ids: String,
        extraType: Int? = nil,
        url: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.AddExtras(
            title: title,
            ids: ids,
            extraType: extraType,
            url: url
        ))
    }

    /// Add a new library section to the server
    @discardableResult
    public func addSection(
        name: String,
        type: Int,
        scanner: String? = nil,
        agent: String,
        metadataAgentProviderGroupId: String? = nil,
        language: String,
        locations: [String]? = nil,
        prefs: AnyJSON? = nil,
        relative: BoolInt? = nil,
        importFromiTunes: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.AddSection(
            name: name,
            type: type,
            scanner: scanner,
            agent: agent,
            metadataAgentProviderGroupId: metadataAgentProviderGroupId,
            language: language,
            locations: locations,
            prefs: prefs,
            relative: relative,
            importFromiTunes: importFromiTunes
        ))
    }

    /// Start the analysis of a metadata item
    @discardableResult
    public func analyzeMetadata(
        ids: String,
        thumbOffset: Double? = nil,
        artOffset: Double? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.AnalyzeMetadata(
            ids: ids,
            thumbOffset: thumbOffset,
            artOffset: artOffset
        ))
    }

    /// The field to autocomplete on is specified by the `{field}.query` parameter. For example
    /// `genre.query` or `title.query`.
    /// Returns a set of items from the filtered items whose `{field}` starts with `{field}.query`. In
    /// the results, a `{field}.queryRange` will be present to express the range of the match
    @discardableResult
    public func autocomplete(
        mediaQuery: MediaQuery? = nil,
        sectionId: Int,
        fieldQuery: String? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.Autocomplete(
            mediaQuery: mediaQuery,
            sectionId: sectionId,
            fieldQuery: fieldQuery
        ))
    }

    /// Cancel the refresh of a section
    @discardableResult
    public func cancelRefresh(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.CancelRefresh(
            sectionId: sectionId
        ))
    }

    /// Clean out any now unused bundles. Bundles can become unused when media is deleted
    @discardableResult
    public func cleanBundles() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.CleanBundles())
    }

    /// Compute a sonic adventure path from a starting track.
    @discardableResult
    public func computeSonicPath(
        id: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.ComputeSonicPath(
            id: id
        ))
    }

    /// Create a marker for this user on the metadata item
    @discardableResult
    public func createMarker(
        ids: String,
        type: Int,
        startTimeOffset: Int,
        endTimeOffset: Int? = nil,
        attributes: AnyJSON? = nil
    ) async throws(PlexError) -> CreateMarkerResponse {
        try await client.perform(Operations.CreateMarker(
            ids: ids,
            type: type,
            startTimeOffset: startTimeOffset,
            endTimeOffset: endTimeOffset,
            attributes: attributes
        ))
    }

    /// Delete the hub caches so they are recomputed on next request
    @discardableResult
    public func deleteCaches() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteCaches())
    }

    /// Delete a library collection from the PMS
    @discardableResult
    public func deleteCollection(
        sectionId: Int,
        collectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteCollection(
            sectionId: sectionId,
            collectionId: collectionId
        ))
    }

    /// Delete all the indexes in a section
    @discardableResult
    public func deleteIndexes(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteIndexes(
            sectionId: sectionId
        ))
    }

    /// Delete all the intro markers in a section
    @discardableResult
    public func deleteIntros(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteIntros(
            sectionId: sectionId
        ))
    }

    /// Delete a library section by id
    @discardableResult
    public func deleteLibrarySection(
        sectionId: String,
        async: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteLibrarySection(
            sectionId: sectionId,
            async: `async`
        ))
    }

    /// Delete a marker for this user on the metadata item
    @discardableResult
    public func deleteMarker(
        ids: String,
        marker: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteMarker(
            ids: ids,
            marker: marker
        ))
    }

    /// Delete a single media from a metadata item in the library
    @discardableResult
    public func deleteMediaItem(
        ids: String,
        mediaItem: String,
        proxy: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteMediaItem(
            ids: ids,
            mediaItem: mediaItem,
            proxy: proxy
        ))
    }

    /// Delete a single metadata item from the library, deleting media as well
    @discardableResult
    public func deleteMetadataItem(
        ids: String,
        proxy: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteMetadataItem(
            ids: ids,
            proxy: proxy
        ))
    }

    /// Delete a stream. Only applies to downloaded subtitle streams or a sidecar subtitle when media
    /// deletion is enabled.
    @discardableResult
    public func deleteStream(
        streamId: Int,
        ext: String
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.DeleteStream(
            streamId: streamId,
            ext: ext
        ))
    }

    /// Start the detection of ads in a metadata item
    @discardableResult
    public func detectAds(
        ids: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DetectAds(
            ids: ids
        ))
    }

    /// Start credit detection on a metadata item
    @discardableResult
    public func detectCredits(
        ids: String,
        force: BoolInt? = nil,
        manual: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DetectCredits(
            ids: ids,
            force: force,
            manual: manual
        ))
    }

    /// Start the detection of intros in a metadata item
    @discardableResult
    public func detectIntros(
        ids: String,
        force: BoolInt? = nil,
        threshold: Double? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DetectIntros(
            ids: ids,
            force: force,
            threshold: threshold
        ))
    }

    /// Start the detection of voice in a metadata item
    @discardableResult
    public func detectVoiceActivity(
        ids: String,
        force: BoolInt? = nil,
        manual: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DetectVoiceActivity(
            ids: ids,
            force: force,
            manual: manual
        ))
    }

    /// Update library section metadata.
    @discardableResult
    public func editLibrarySection(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EditLibrarySection(
            sectionId: sectionId
        ))
    }

    /// Edit a marker for this user on the metadata item
    @discardableResult
    public func editMarker(
        ids: String,
        marker: String,
        type: Int,
        startTimeOffset: Int,
        endTimeOffset: Int? = nil,
        attributes: AnyJSON? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EditMarker(
            ids: ids,
            marker: marker,
            type: type,
            startTimeOffset: startTimeOffset,
            endTimeOffset: endTimeOffset,
            attributes: attributes
        ))
    }

    /// Edit metadata items setting fields
    @discardableResult
    public func editMetadataItem(
        ids: [String],
        args: AnyJSON? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EditMetadataItem(
            ids: ids,
            args: args
        ))
    }

    /// Edit a library section by id setting parameters
    @discardableResult
    public func editSection(
        sectionId: String,
        name: String? = nil,
        scanner: String? = nil,
        agent: String,
        metadataAgentProviderGroupId: String? = nil,
        language: String? = nil,
        locations: [String]? = nil,
        prefs: AnyJSON? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EditSection(
            sectionId: sectionId,
            name: name,
            scanner: scanner,
            agent: agent,
            metadataAgentProviderGroupId: metadataAgentProviderGroupId,
            language: language,
            locations: locations,
            prefs: prefs
        ))
    }

    /// Permanently remove items from the trash for a library section.
    @discardableResult
    public func emptyTrash(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EmptyTrash(
            sectionId: sectionId
        ))
    }

    /// Permanently remove items from the trash for a library section.
    @discardableResult
    public func emptyTrashPost(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EmptyTrashPost(
            sectionId: sectionId
        ))
    }

    /// Empty trash in the section, permanently deleting media/metadata for missing media
    @discardableResult
    public func emptyTrashPut(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.EmptyTrashPut(
            sectionId: sectionId
        ))
    }

    /// Start the chapter thumb generation for an item
    @discardableResult
    public func generateThumbs(
        ids: String,
        force: BoolInt? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GenerateThumbs(
            ids: ids,
            force: force
        ))
    }

    /// Get the leaves for a metadata item such as the episodes in a show
    @discardableResult
    public func getAllItemLeaves(
        ids: String
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetAllItemLeaves(
            ids: ids
        ))
    }

    /// Get augmentation status and potentially wait for completion
    @discardableResult
    public func getAugmentationStatus(
        augmentationId: String,
        wait: BoolInt? = nil
    ) async throws(PlexError) -> String {
        try await client.perform(Operations.GetAugmentationStatus(
            augmentationId: augmentationId,
            wait: wait
        ))
    }

    /// Get the sort mechanisms available in a section
    @discardableResult
    public func getAvailableSorts(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithSorts {
        try await client.perform(Operations.GetAvailableSorts(
            sectionId: sectionId
        ))
    }

    /// Browse items in a library section grouped by content rating.
    @discardableResult
    public func getByContentRating(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetByContentRating(
            sectionId: sectionId
        ))
    }

    /// Browse items in a library section grouped by decade.
    @discardableResult
    public func getByDecade(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetByDecade(
            sectionId: sectionId
        ))
    }

    /// Browse items in a library section by underlying filesystem folder.
    @discardableResult
    public func getByFolder(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetByFolder(
            sectionId: sectionId
        ))
    }

    /// Browse items in a library section grouped by resolution.
    @discardableResult
    public func getByResolution(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetByResolution(
            sectionId: sectionId
        ))
    }

    /// Browse items in a library section grouped by year.
    @discardableResult
    public func getByYear(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetByYear(
            sectionId: sectionId
        ))
    }

    /// Get a single chapter image for a piece of media
    @discardableResult
    public func getChapterImage(
        mediaId: Int,
        chapter: Int
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetChapterImage(
            mediaId: mediaId,
            chapter: chapter
        ))
    }

    /// Get all collections in a section
    @discardableResult
    public func getCollections(
        mediaQuery: MediaQuery? = nil,
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetCollections(
            mediaQuery: mediaQuery,
            sectionId: sectionId
        ))
    }

    /// Represents a "Common" item. It contains only the common attributes of the items selected by the
    /// provided filter
    /// Fields which are not common will be expressed in the `mixedFields` field
    @discardableResult
    public func getCommon(
        mediaQuery: MediaQuery? = nil,
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetCommon(
            mediaQuery: mediaQuery,
            sectionId: sectionId
        ))
    }

    /// Get the extras for a metadata item
    @discardableResult
    public func getExtras(
        ids: String
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetExtras(
            ids: ids
        ))
    }

    /// Get a bundle file for a metadata or media item. This is either an image or a mp3 (for a show's
    /// theme)
    @discardableResult
    public func getFile(
        ids: String,
        url: String? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetFile(
            ids: ids,
            url: url
        ))
    }

    /// Get list of first characters in this section
    @discardableResult
    public func getFirstCharacters(
        mediaQuery: MediaQuery? = nil,
        sectionId: Int
    ) async throws(PlexError) -> GetFirstCharactersResponse {
        try await client.perform(Operations.GetFirstCharacters(
            mediaQuery: mediaQuery,
            sectionId: sectionId
        ))
    }

    /// Extract an image from the BIF for a part at a particular offset
    @discardableResult
    public func getImageFromBif(
        partId: Int,
        index: GetImageFromBifIndex,
        offset: Int
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetImageFromBif(
            partId: partId,
            index: index,
            offset: offset
        ))
    }

    /// Get the artwork, thumb, element for a metadata item
    @discardableResult
    public func getItemArtwork(
        ids: String,
        element: GetItemArtworkElement,
        timestamp: Int
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetItemArtwork(
            ids: ids,
            element: element,
            timestamp: timestamp
        ))
    }

    /// Get a tree of metadata items, such as the seasons/episodes of a show
    @discardableResult
    public func getItemTree(
        ids: String
    ) async throws(PlexError) -> MediaContainerWithNestedMetadata {
        try await client.perform(Operations.GetItemTree(
            ids: ids
        ))
    }

    /// Returns details for the library. This can be thought of as an interstitial endpoint because it
    /// contains information about the library, rather than content itself. It often contains a list of
    /// `Directory` metadata objects: These used to be used by clients to build a menuing system.
    @discardableResult
    public func getLibraryDetails(
        sectionId: String,
        includeDetails: BoolInt? = nil
    ) async throws(PlexError) -> GetLibraryDetailsResponse {
        try await client.perform(Operations.GetLibraryDetails(
            sectionId: sectionId,
            includeDetails: includeDetails
        ))
    }

    /// Request all metadata items according to a query.
    @discardableResult
    public func getLibraryItems(
        mediaQuery: MediaQuery? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetLibraryItems(
            mediaQuery: mediaQuery
        ))
    }

    /// The matches endpoint is used to match content external to the library with content inside the
    /// library. This is done by passing a series of semantic "hints" about the content (its type, name,
    /// or release year). Each type (e.g. movie) has a canonical set of minimal required hints.
    /// This ability to match content is useful in a variety of scenarios. For example, in the DVR, the
    /// EPG uses the endpoint to match recording rules against airing content. And in the cloud, the UMP
    /// uses the endpoint to match up a piece of media with rich metadata.
    /// The endpoint response can including multiple matches, if there is ambiguity, each one containing
    /// a `score` from 0 to 100. For somewhat historical reasons, anything over 85 is considered a
    /// positive match (we prefer false negatives over false positives in general for matching).
    /// The `guid` hint is somewhat special, in that it generally represents a unique identity for a
    /// piece of media (e.g. the IMDB `ttXXX`) identifier, in contrast with other hints which can be
    /// much more ambiguous (e.g. a title of `Jane Eyre`, which could refer to the 1943 or the 2011
    /// version).
    /// Episodes require either a season/episode pair, or an air date (or both). Either the path must be
    /// sent, or the show title
    @discardableResult
    public func getLibraryMatches(
        type: MediaType? = nil,
        title: String? = nil,
        includeFullMetadata: BoolInt? = nil,
        includeAncestorMetadata: BoolInt? = nil,
        includeAlternateMetadataSources: BoolInt? = nil,
        guid: String? = nil,
        year: Int? = nil,
        path2: String? = nil,
        grandparentTitle: String? = nil,
        grandparentYear: Int? = nil,
        parentIndex: Int? = nil,
        index: Int? = nil,
        originallyAvailableAt: String? = nil,
        parentTitle: String? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetLibraryMatches(
            type: type,
            title: title,
            includeFullMetadata: includeFullMetadata,
            includeAncestorMetadata: includeAncestorMetadata,
            includeAlternateMetadataSources: includeAlternateMetadataSources,
            guid: guid,
            year: year,
            path2: path2,
            grandparentTitle: grandparentTitle,
            grandparentYear: grandparentYear,
            parentIndex: parentIndex,
            index: index,
            originallyAvailableAt: originallyAvailableAt,
            parentTitle: parentTitle
        ))
    }

    /// Get hubs for a library section.
    @discardableResult
    public func getLibrarySectionHubs(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithHubs {
        try await client.perform(Operations.GetLibrarySectionHubs(
            sectionId: sectionId
        ))
    }

    /// Fallback for non-owners to list library sections.
    @discardableResult
    public func getLibrarySectionsFallback() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetLibrarySectionsFallback())
    }

    /// Get a media part for streaming or download.
    /// - streaming: This is the default scenario.  Bandwidth usage on this endpoint will be guaranteed (on the server's end) to be at least the bandwidth reservation given in the decision.  If no decision exists, an ad-hoc decision will be created if sufficient bandwidth exists.  Clients should not rely on ad-hoc decisions being made as this may be removed in the future.
    /// - download: Indicated if the query parameter indicates this is a download.  Bandwidth will be prioritized behind playbacks and will get a fair share of what remains.
    @discardableResult
    public func getMediaPart(
        partId: Int,
        changestamp: Int,
        filename: String,
        download: BoolInt? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetMediaPart(
            partId: partId,
            changestamp: changestamp,
            filename: filename,
            download: download
        ))
    }

    /// Get children of a show, season, artist, or album.
    @discardableResult
    public func getMetadataChildren(
        id: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetMetadataChildren(
            id: id
        ))
    }

    /// Get grandchildren (e.g. episodes under a show).
    @discardableResult
    public func getMetadataGrandchildren(
        id: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetMetadataGrandchildren(
            id: id
        ))
    }

    /// Get grandparent metadata shortcut.
    @discardableResult
    public func getMetadataGrandparent(
        id: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetMetadataGrandparent(
            id: id
        ))
    }

    /// Get On Deck status for a show or season.
    @discardableResult
    public func getMetadataOnDeck(
        id: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetMetadataOnDeck(
            id: id
        ))
    }

    /// Get parent metadata shortcut.
    @discardableResult
    public func getMetadataParent(
        id: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetMetadataParent(
            id: id
        ))
    }

    /// Get user reviews for a metadata item.
    @discardableResult
    public func getMetadataReviews(
        id: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetMetadataReviews(
            id: id
        ))
    }

    /// Get sonically similar items for a music track.
    @discardableResult
    public func getNearestMetadata(
        id: Int,
        excludeParentID: Int? = nil,
        excludeGrandparentID: Int? = nil,
        limit: Int? = nil,
        maxDistance: Double? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetNearestMetadata(
            id: id,
            excludeParentID: excludeParentID,
            excludeGrandparentID: excludeGrandparentID,
            limit: limit,
            maxDistance: maxDistance
        ))
    }

    /// Get the newest additions for a specific library section.
    @discardableResult
    public func getNewestForSection(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetNewestForSection(
            sectionId: sectionId
        ))
    }

    /// Get the On Deck items for a specific library section.
    @discardableResult
    public func getOnDeckForSection(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetOnDeckForSection(
            sectionId: sectionId
        ))
    }

    /// Get BIF index for a part by index type
    @discardableResult
    public func getPartIndex(
        partId: Int,
        index: GetPartIndexIndex,
        interval: Int? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetPartIndex(
            partId: partId,
            index: index,
            interval: interval
        ))
    }

    /// Get details for a single actor.
    @discardableResult
    public func getPerson(
        personId: String
    ) async throws(PlexError) -> MediaContainerWithTags {
        try await client.perform(Operations.GetPerson(
            personId: personId
        ))
    }

    /// Get random artwork across sections. This is commonly used for a screensaver.
    ///
    /// This retrieves 100 random artwork paths in the specified sections and returns them. Restrictions
    /// are put in place to not return artwork for items the user is not allowed to access. Artwork will
    /// be for Movies, Shows, and Artists only.
    @discardableResult
    public func getRandomArtwork(
        sections: [Int]? = nil
    ) async throws(PlexError) -> MediaContainerWithArtwork {
        try await client.perform(Operations.GetRandomArtwork(
            sections: sections
        ))
    }

    /// Get recently added items for a specific library section.
    @discardableResult
    public func getRecentlyAddedForSection(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetRecentlyAddedForSection(
            sectionId: sectionId
        ))
    }

    /// Get recently added items across all library sections.
    @discardableResult
    public func getRecentlyAddedGlobal() async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetRecentlyAddedGlobal())
    }

    /// Get a hub of related items to a metadata item
    @discardableResult
    public func getRelatedItems(
        ids: String
    ) async throws(PlexError) -> MediaContainerWithHubs {
        try await client.perform(Operations.GetRelatedItems(
            ids: ids
        ))
    }

    /// Get the root library object.
    @discardableResult
    public func getRootLibrary() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetRootLibrary())
    }

    /// Get available metadata agents for a library section.
    @discardableResult
    public func getSectionAgents(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSectionAgents(
            sectionId: sectionId
        ))
    }

    /// Get artists for a music library section.
    @discardableResult
    public func getSectionArtists(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSectionArtists(
            sectionId: sectionId
        ))
    }

    /// Get clips for a library section.
    @discardableResult
    public func getSectionClips(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSectionClips(
            sectionId: sectionId
        ))
    }

    /// Get library section metadata.
    @discardableResult
    public func getSectionEdit(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.GetSectionEdit(
            sectionId: sectionId
        ))
    }

    /// Get episodes for a TV library section.
    @discardableResult
    public func getSectionEpisodes(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSectionEpisodes(
            sectionId: sectionId
        ))
    }

    /// Get common filters on a section
    @discardableResult
    public func getSectionFilters(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSectionFilters(
            sectionId: sectionId
        ))
    }

    /// Get a composite image of images in this section
    @discardableResult
    public func getSectionImage(
        mediaQuery: MediaQuery? = nil,
        composite: GetSectionImageComposite? = nil,
        sectionId: Int,
        updatedAt: Int
    ) async throws(PlexError) -> BinaryResponse {
        try await client.perform(Operations.GetSectionImage(
            mediaQuery: mediaQuery,
            composite: composite,
            sectionId: sectionId,
            updatedAt: updatedAt
        ))
    }

    /// Get labels for a library section.
    @discardableResult
    public func getSectionLabels(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithTags {
        try await client.perform(Operations.GetSectionLabels(
            sectionId: sectionId
        ))
    }

    /// Get movies for a movie library section.
    @discardableResult
    public func getSectionMovies(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSectionMovies(
            sectionId: sectionId
        ))
    }

    /// Get photos for a photo library section.
    @discardableResult
    public func getSectionPhotos(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSectionPhotos(
            sectionId: sectionId
        ))
    }

    /// Get playlists belonging to a library section.
    @discardableResult
    public func getSectionPlaylists(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithPlaylistMetadata {
        try await client.perform(Operations.GetSectionPlaylists(
            sectionId: sectionId
        ))
    }

    /// Get the prefs for a section by id and potentially overriding the agent
    @discardableResult
    public func getSectionPreferences(
        sectionId: Int,
        agent: String? = nil
    ) async throws(PlexError) -> MediaContainerWithSettings {
        try await client.perform(Operations.GetSectionPreferences(
            sectionId: sectionId,
            agent: agent
        ))
    }

    /// Get section-specific settings.
    @discardableResult
    public func getSectionSettings(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.GetSectionSettings(
            sectionId: sectionId
        ))
    }

    /// Get shows for a TV library section.
    @discardableResult
    public func getSectionShows(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSectionShows(
            sectionId: sectionId
        ))
    }

    /// Get tags in a library section.
    @discardableResult
    public func getSectionTags(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithTags {
        try await client.perform(Operations.GetSectionTags(
            sectionId: sectionId
        ))
    }

    /// Get section timeline data.
    @discardableResult
    public func getSectionTimeline(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSectionTimeline(
            sectionId: sectionId
        ))
    }

    /// A library section (commonly referred to as just a library) is a collection of media. Libraries
    /// are typed, and depending on their type provide either a flat or a hierarchical view of the
    /// media. For example, a music library has an artist > albums > tracks structure, whereas a movie
    /// library is flat.
    /// Libraries have features beyond just being a collection of media; for starters, they include
    /// information about supported types, filters and sorts. This allows a client to provide a rich
    /// interface around the media (e.g. allow sorting movies by release year).
    @discardableResult
    public func getSections() async throws(PlexError) -> GetSectionsResponse {
        try await client.perform(Operations.GetSections())
    }

    /// Get a section's preferences for a metadata type
    @discardableResult
    public func getSectionsPrefs(
        type: Int,
        agent: String? = nil
    ) async throws(PlexError) -> MediaContainerWithSettings {
        try await client.perform(Operations.GetSectionsPrefs(
            type: type,
            agent: agent
        ))
    }

    /// Get a stream (such as a sidecar subtitle stream)
    @discardableResult
    public func getStream(
        streamId: Int,
        ext: String,
        encoding: String? = nil,
        format: String? = nil,
        autoAdjustSubtitle: BoolInt? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetStream(
            streamId: streamId,
            ext: ext,
            encoding: encoding,
            format: format,
            autoAdjustSubtitle: autoAdjustSubtitle
        ))
    }

    /// The the loudness of a stream in db, one entry per 100ms
    @discardableResult
    public func getStreamLevels(
        streamId: Int,
        subsample: Int? = nil
    ) async throws(PlexError) -> GetStreamLevelsResponse {
        try await client.perform(Operations.GetStreamLevels(
            streamId: streamId,
            subsample: subsample
        ))
    }

    /// The the loudness of a stream in db, one number per line, one entry per 100ms
    @discardableResult
    public func getStreamLoudness(
        streamId: Int,
        subsample: Int? = nil
    ) async throws(PlexError) -> String {
        try await client.perform(Operations.GetStreamLoudness(
            streamId: streamId,
            subsample: subsample
        ))
    }

    /// Add a subtitle to a metadata item
    @discardableResult
    public func getSubtitles(
        ids: String,
        title: String? = nil,
        language: String? = nil,
        mediaItemID: Int? = nil,
        url: String? = nil,
        format: String? = nil,
        forced: BoolInt? = nil,
        hearingImpaired: BoolInt? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSubtitles(
            ids: ids,
            title: title,
            language: language,
            mediaItemID: mediaItemID,
            url: url,
            format: format,
            forced: forced,
            hearingImpaired: hearingImpaired
        ))
    }

    /// Get all library tags of a type
    @discardableResult
    public func getTags(
        type: MediaType? = nil
    ) async throws(PlexError) -> GetTagsResponse {
        try await client.perform(Operations.GetTags(
            type: type
        ))
    }

    /// Get unwatched items for a specific library section.
    @discardableResult
    public func getUnwatchedForSection(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetUnwatchedForSection(
            sectionId: sectionId
        ))
    }

    /// This endpoint takes a file path specified in the `url` parameter, matches it using the scanner's
    /// match mechanism, downloads rich metadata, and then ingests the item as a transient item (without
    /// a library section). In the case where the file represents an episode, the entire tree (show,
    /// season, and episode) is added as transient items. At this time, movies and episodes are the only
    /// supported types, which are gleaned automatically from the file path.
    /// Note that any of the parameters passed to the metadata details endpoint (e.g. `includeExtras=1`)
    /// work here.
    @discardableResult
    public func ingestTransientItem(
        url: String? = nil,
        virtualFilePath: String? = nil,
        computeHashes: BoolInt? = nil,
        ingestNonMatches: BoolInt? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.IngestTransientItem(
            url: url,
            virtualFilePath: virtualFilePath,
            computeHashes: computeHashes,
            ingestNonMatches: ingestNonMatches
        ))
    }

    /// Get the list of metadata matches for a metadata item
    @discardableResult
    public func listMatches(
        ids: String,
        title: String? = nil,
        parentTitle: String? = nil,
        agent: String? = nil,
        language: String? = nil,
        year: Int? = nil,
        manual: BoolInt? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.ListMatches(
            ids: ids,
            title: title,
            parentTitle: parentTitle,
            agent: agent,
            language: language,
            year: year,
            manual: manual
        ))
    }

    /// Get all the media for a single actor.
    @discardableResult
    public func listPersonMedia(
        personId: String
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.ListPersonMedia(
            personId: personId
        ))
    }

    /// Get a list of similar items to a metadata item
    @discardableResult
    public func listSimilar(
        count: Int? = nil,
        ids: String
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.ListSimilar(
            count: count,
            ids: ids
        ))
    }

    /// Get the list of users which have played this item starting with the most
    @discardableResult
    public func listTopUsers(
        ids: String
    ) async throws(PlexError) -> ListTopUsersResponse {
        try await client.perform(Operations.ListTopUsers(
            ids: ids
        ))
    }

    /// Match a metadata item to a guid
    @discardableResult
    public func matchItem(
        ids: String,
        guid: String? = nil,
        name: String? = nil,
        year: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.MatchItem(
            ids: ids,
            guid: guid,
            name: name,
            year: year
        ))
    }

    /// Match items in a library section against metadata providers.
    @discardableResult
    public func matchSectionItems(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.MatchSectionItems(
            sectionId: sectionId
        ))
    }

    /// Merge a metadata item with other items
    @discardableResult
    public func mergeItems(
        ids: String,
        ids2: [String]? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.MergeItems(
            ids: ids,
            ids2: ids2
        ))
    }

    /// Move library section paths.
    @discardableResult
    public func moveSection(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.MoveSection(
            sectionId: sectionId
        ))
    }

    /// Initiate optimize on the database.
    @discardableResult
    public func optimizeDatabase(
        async: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.OptimizeDatabase(
            async: `async`
        ))
    }

    /// Optimize the database globally across all library sections.
    @discardableResult
    public func optimizeLibrary() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.OptimizeLibrary())
    }

    /// Optimize the database globally across all library sections.
    @discardableResult
    public func optimizeLibraryPost() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.OptimizeLibraryPost())
    }

    /// Optimize the database for a specific library section.
    @discardableResult
    public func optimizeSection(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.OptimizeSection(
            sectionId: sectionId
        ))
    }

    /// Optimize the database for a specific library section.
    @discardableResult
    public func optimizeSectionPost(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.OptimizeSectionPost(
            sectionId: sectionId
        ))
    }

    /// Refresh a metadata item from the agent
    @discardableResult
    public func refreshItemsMetadata(
        ids: String,
        agent: String? = nil,
        markUpdated: BoolInt? = nil,
        skipRefresh: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RefreshItemsMetadata(
            ids: ids,
            agent: agent,
            markUpdated: markUpdated,
            skipRefresh: skipRefresh
        ))
    }

    /// Trigger a metadata refresh for a library section.
    @discardableResult
    public func refreshSection(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RefreshSection(
            sectionId: sectionId
        ))
    }

    /// Trigger a metadata refresh for a library section.
    @discardableResult
    public func refreshSectionPost(
        sectionId: Int,
        force: BoolInt? = nil,
        path2: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RefreshSectionPost(
            sectionId: sectionId,
            force: force,
            path2: path2
        ))
    }

    /// Tell PMS to refresh all section metadata
    @discardableResult
    public func refreshSectionsMetadata(
        force: Bool? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RefreshSectionsMetadata(
            force: force
        ))
    }

    /// Search within a specific library section.
    @discardableResult
    public func searchSection(
        sectionId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.SearchSection(
            sectionId: sectionId
        ))
    }

    /// Set the artwork, thumb, element for a metadata item
    /// Generally only the admin can perform this action. The exception is if the metadata is a playlist
    /// created by the user
    @discardableResult
    public func setItemArtwork(
        ids: String,
        element: SetItemArtworkElement,
        url: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SetItemArtwork(
            ids: ids,
            element: element,
            url: url
        ))
    }

    /// Set the preferences on a metadata item
    @discardableResult
    public func setItemPreferences(
        ids: String,
        args: AnyJSON? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SetItemPreferences(
            ids: ids,
            args: args
        ))
    }

    /// Set the prefs for a section by id
    @discardableResult
    public func setSectionPreferences(
        sectionId: Int,
        prefs: AnyJSON
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SetSectionPreferences(
            sectionId: sectionId,
            prefs: prefs
        ))
    }

    /// Set a stream offset in ms. This may not be respected by all clients
    @discardableResult
    public func setStreamOffset(
        streamId: Int,
        ext: String,
        offset: Int? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.SetStreamOffset(
            streamId: streamId,
            ext: ext,
            offset: offset
        ))
    }

    /// Set which streams (audio/subtitle) are selected by this user
    @discardableResult
    public func setStreamSelection(
        partId: Int,
        audioStreamID: Int? = nil,
        subtitleStreamID: Int? = nil,
        allParts: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SetStreamSelection(
            partId: partId,
            audioStreamID: audioStreamID,
            subtitleStreamID: subtitleStreamID,
            allParts: allParts
        ))
    }

    /// Split a metadata item into multiple items
    @discardableResult
    public func splitItem(
        ids: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SplitItem(
            ids: ids
        ))
    }

    /// Start analysis of all items in a section. If BIF generation is enabled, this will also be
    /// started on this section
    @discardableResult
    public func startAnalysis(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.StartAnalysis(
            sectionId: sectionId
        ))
    }

    /// Start the indexing (BIF generation) of an item
    @discardableResult
    public func startBifGeneration(
        ids: String,
        force: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.StartBifGeneration(
            ids: ids,
            force: force
        ))
    }

    /// Stop all refreshes across all sections
    @discardableResult
    public func stopAllRefreshes() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.StopAllRefreshes())
    }

    /// Unmatch a metadata item to info fetched from the agent
    @discardableResult
    public func unmatch(
        ids: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.Unmatch(
            ids: ids
        ))
    }

    /// Unmatch items in a library section from metadata providers.
    @discardableResult
    public func unmatchSectionItems(
        sectionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.UnmatchSectionItems(
            sectionId: sectionId
        ))
    }

    /// Set the artwork, thumb, element for a metadata item
    /// Generally only the admin can perform this action. The exception is if the metadata is a playlist
    /// created by the user
    @discardableResult
    public func updateItemArtwork(
        ids: String,
        element: UpdateItemArtworkElement,
        url: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.UpdateItemArtwork(
            ids: ids,
            element: element,
            url: url
        ))
    }

    /// This endpoint takes an large possible set of values. Here are some examples.
    /// - **Parameters, extra documentation**
    /// - artist.title.value
    /// - When used with track, both artist.title.value and album.title.value need to be specified
    /// - title.value usage
    /// - Summary
    /// - Tracks always rename and never merge
    /// - Albums and Artists
    /// - if single item and item without title does not exist, it is renamed.
    /// - if single item and item with title does exist they are merged.
    /// - if multiple they are always merged.
    /// - Tracks
    /// - Works as expected will update the track's title
    /// - Single track:    `/library/sections/{id}/all?type=10&id=42&title.value=NewName`
    /// - Multiple tracks: `/library/sections/{id}/all?type=10&id=42,43,44&title.value=NewName`
    /// - All tracks:      `/library/sections/{id}/all?type=10&title.value=NewName`
    /// - Albums
    /// - Functionality changes depending on the existence of an album with the same title
    /// - Album exists
    /// - Single album: `/library/sections/{id}/all?type=9&id=42&title.value=Album 2`
    /// - Album with id 42 is merged into album titled "Album 2"
    /// - Multiple/All albums: `/library/sections/{id}/all?type=9&title.value=Moo Album`
    /// - All albums are merged into the existing album titled "Moo Album"
    /// - Album does not exist
    /// - Single album: `/library/sections/{id}/all?type=9&id=42&title.value=NewAlbumTitle`
    /// - Album with id 42 has title modified to "NewAlbumTitle"
    /// - Multiple/All albums: `/library/sections/{id}/all?type=9&title.value=NewAlbumTitle`
    /// - All albums are merged into a new album with title="NewAlbumTitle"
    /// - Artists
    /// - Functionaly changes depending on the existence of an artist with the same title.
    /// - Artist exists
    /// - Single artist: `/library/sections/{id}/all?type=8&id=42&title.value=Artist 2`
    /// - Artist with id 42 is merged into existing artist titled "Artist 2"
    /// - Multiple/All artists: `/library/sections/{id}/all?type=8&title.value=Artist 3`
    /// - All artists are merged into the existing artist titled "Artist 3"
    /// - Artist does not exist
    /// - Single artist: `/library/sections/{id}/all?type=8&id=42&title.value=NewArtistTitle`
    /// - Artist with id 42 has title modified to "NewArtistTitle"
    /// - Multiple/All artists: `/library/sections/{id}/all?type=8&title.value=NewArtistTitle`
    /// - All artists are merged into a new artist with title="NewArtistTitle"
    ///
    /// - **Notes**
    /// - Technically square brackets are not allowed in an URI except the Internet Protocol Literal Address
    /// - RFC3513: A host identified by an Internet Protocol literal address, version 6 [RFC3513] or later, is distinguished by enclosing the IP literal within square brackets ("[" and "]"). This is the only place where square bracket characters are allowed in the URI syntax.
    /// - Escaped square brackets are allowed, but don't render well
    @discardableResult
    public func updateItems(
        sectionId: String,
        type: String? = nil,
        filters: String? = nil,
        fieldValue: String? = nil,
        fieldLocked: BoolInt? = nil,
        titleValue: String? = nil,
        artistTitleValue: String? = nil,
        artistTitleId: String? = nil,
        albumTitleValue: String? = nil,
        albumTitleId: String? = nil,
        tagtypeIdxTagTag: String? = nil,
        tagtypeIdxTaggingObject: String? = nil,
        tagtypeTagTag: String? = nil,
        tagtypeTag: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.UpdateItems(
            sectionId: sectionId,
            type: type,
            filters: filters,
            fieldValue: fieldValue,
            fieldLocked: fieldLocked,
            titleValue: titleValue,
            artistTitleValue: artistTitleValue,
            artistTitleId: artistTitleId,
            albumTitleValue: albumTitleValue,
            albumTitleId: albumTitleId,
            tagtypeIdxTagTag: tagtypeIdxTagTag,
            tagtypeIdxTaggingObject: tagtypeIdxTaggingObject,
            tagtypeTagTag: tagtypeTagTag,
            tagtypeTag: tagtypeTag
        ))
    }

    /// Upload custom background art for a metadata item.
    @discardableResult
    public func uploadArt(
        id: Int,
        body: Data? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.UploadArt(
            id: id,
            body: body
        ))
    }

    /// Upload a custom poster image for a metadata item.
    @discardableResult
    public func uploadPoster(
        id: Int,
        body: Data? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.UploadPoster(
            id: id,
            body: body
        ))
    }
}

extension PlexClient {
    /// The `Library` operations of the Plex API.
    public var library: LibraryAPI { LibraryAPI(client: self) }
}
