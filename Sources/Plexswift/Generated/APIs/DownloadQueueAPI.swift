// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Download Queue` operations of the Plex API.
///
/// Reached through ``PlexClient/downloadQueue``.
public struct DownloadQueueAPI: Sendable {
    let client: PlexClient

    /// Available: 0.2.0
    ///
    /// Add items to the download queue
    @discardableResult
    public func addDownloadQueueItems(
        advancedSubtitles: AddDownloadQueueItemsAdvancedSubtitles? = nil,
        audioBoost: Int? = nil,
        audioChannelCount: Int? = nil,
        autoAdjustQuality: BoolInt? = nil,
        autoAdjustSubtitle: BoolInt? = nil,
        directPlay: BoolInt? = nil,
        directStream: BoolInt? = nil,
        directStreamAudio: BoolInt? = nil,
        disableResolutionRotation: BoolInt? = nil,
        hasMDE: BoolInt? = nil,
        location: AddDownloadQueueItemsLocation? = nil,
        mediaBufferSize: Int? = nil,
        mediaIndex: Int? = nil,
        musicBitrate: Int? = nil,
        offset: Double? = nil,
        partIndex: Int? = nil,
        path2: String? = nil,
        peakBitrate: Int? = nil,
        photoResolution: String? = nil,
        protocol: AddDownloadQueueItemsProtocol? = nil,
        secondsPerSegment: Int? = nil,
        subtitleSize: Int? = nil,
        subtitles: AddDownloadQueueItemsSubtitles? = nil,
        videoBitrate: Int? = nil,
        videoQuality: Int? = nil,
        videoResolution: String? = nil,
        queueId: Int,
        keys: [String]
    ) async throws(PlexError) -> AddDownloadQueueItemsResponse {
        try await client.perform(Operations.AddDownloadQueueItems(
            advancedSubtitles: advancedSubtitles,
            audioBoost: audioBoost,
            audioChannelCount: audioChannelCount,
            autoAdjustQuality: autoAdjustQuality,
            autoAdjustSubtitle: autoAdjustSubtitle,
            directPlay: directPlay,
            directStream: directStream,
            directStreamAudio: directStreamAudio,
            disableResolutionRotation: disableResolutionRotation,
            hasMDE: hasMDE,
            location: location,
            mediaBufferSize: mediaBufferSize,
            mediaIndex: mediaIndex,
            musicBitrate: musicBitrate,
            offset: offset,
            partIndex: partIndex,
            path2: path2,
            peakBitrate: peakBitrate,
            photoResolution: photoResolution,
            protocol: `protocol`,
            secondsPerSegment: secondsPerSegment,
            subtitleSize: subtitleSize,
            subtitles: subtitles,
            videoBitrate: videoBitrate,
            videoQuality: videoQuality,
            videoResolution: videoResolution,
            queueId: queueId,
            keys: keys
        ))
    }

    /// Available: 0.2.0
    ///
    /// Creates a download queue for this client if one doesn't exist, or returns the existing queue for
    /// this client and user.
    @discardableResult
    public func createDownloadQueue() async throws(PlexError) -> CreateDownloadQueueResponse {
        try await client.perform(Operations.CreateDownloadQueue())
    }

    /// Available: 0.2.0
    ///
    /// Get a download queue by its id
    @discardableResult
    public func getDownloadQueue(
        queueId: Int
    ) async throws(PlexError) -> GetDownloadQueueResponse {
        try await client.perform(Operations.GetDownloadQueue(
            queueId: queueId
        ))
    }

    /// Available: 0.2.0
    ///
    /// Get items from a download queue
    @discardableResult
    public func getDownloadQueueItems(
        queueId: Int,
        itemId: [Int]
    ) async throws(PlexError) -> GetDownloadQueueItemsResponse {
        try await client.perform(Operations.GetDownloadQueueItems(
            queueId: queueId,
            itemId: itemId
        ))
    }

    /// Available: 0.2.0
    ///
    /// Grab the media for a download queue item
    @discardableResult
    public func getDownloadQueueMedia(
        queueId: Int,
        itemId: Int
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetDownloadQueueMedia(
            queueId: queueId,
            itemId: itemId
        ))
    }

    /// Available: 0.2.0
    ///
    /// Grab the decision for a download queue item
    @discardableResult
    public func getItemDecision(
        queueId: Int,
        itemId: Int
    ) async throws(PlexError) -> MediaContainerWithDecision {
        try await client.perform(Operations.GetItemDecision(
            queueId: queueId,
            itemId: itemId
        ))
    }

    /// Available: 0.2.0
    ///
    /// Get items from a download queue
    @discardableResult
    public func listDownloadQueueItems(
        queueId: Int
    ) async throws(PlexError) -> ListDownloadQueueItemsResponse {
        try await client.perform(Operations.ListDownloadQueueItems(
            queueId: queueId
        ))
    }

    /// delete items from a download queue
    @discardableResult
    public func removeDownloadQueueItems(
        queueId: Int,
        itemId: [Int]
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.RemoveDownloadQueueItems(
            queueId: queueId,
            itemId: itemId
        ))
    }

    /// Available: 0.2.0
    ///
    /// Reprocess download queue items with previous decision parameters
    @discardableResult
    public func restartProcessingDownloadQueueItems(
        queueId: Int,
        itemId: [Int]
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.RestartProcessingDownloadQueueItems(
            queueId: queueId,
            itemId: itemId
        ))
    }
}

extension PlexClient {
    /// The `Download Queue` operations of the Plex API.
    public var downloadQueue: DownloadQueueAPI { DownloadQueueAPI(client: self) }
}
