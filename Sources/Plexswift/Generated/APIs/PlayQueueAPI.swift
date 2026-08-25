// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Play Queue` operations of the Plex API.
///
/// Reached through ``PlexClient/playQueue``.
public struct PlayQueueAPI: Sendable {
    let client: PlexClient

    /// Adds an item to a play queue (e.g. party mode). Increments the version of the play queue. Takes
    /// the following parameters (`uri` and `playlistID` are mutually exclusive). Returns the modified
    /// play queue.
    @discardableResult
    public func addToPlayQueue(
        playQueueId: Int,
        uri: String? = nil,
        playlistID: String? = nil,
        next: BoolInt? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.AddToPlayQueue(
            playQueueId: playQueueId,
            uri: uri,
            playlistID: playlistID,
            next: next
        ))
    }

    /// Deletes all items in the play queue, and increases the version of the play queue.
    @discardableResult
    public func clearPlayQueue(
        playQueueId: Int
    ) async throws(PlexError) -> MediaContainerWithPlaylistMetadata {
        try await client.perform(Operations.ClearPlayQueue(
            playQueueId: playQueueId
        ))
    }

    /// Makes a new play queue for a device. The source of the playqueue can either be a URI, or a
    /// playlist. The response is a media container with the initial items in the queue. Each item in
    /// the queue will be a regular item but with `playQueueItemID` - a unique ID since the queue could
    /// have repeated items with the same `ratingKey`.
    /// Note: Either `uri` or `playlistID` must be specified
    @discardableResult
    public func createPlayQueue(
        uri: String? = nil,
        playlistID: Int? = nil,
        type: CreatePlayQueueType,
        key: String? = nil,
        shuffle: BoolInt? = nil,
        repeat: BoolInt? = nil,
        continuous: BoolInt? = nil,
        extrasPrefixCount: Int? = nil,
        recursive: BoolInt? = nil,
        onDeck: BoolInt? = nil
    ) async throws(PlexError) -> MediaContainerWithPlayQueue {
        try await client.perform(Operations.CreatePlayQueue(
            uri: uri,
            playlistID: playlistID,
            type: type,
            key: key,
            shuffle: shuffle,
            repeat: `repeat`,
            continuous: continuous,
            extrasPrefixCount: extrasPrefixCount,
            recursive: recursive,
            onDeck: onDeck
        ))
    }

    /// Deletes an item in a play queue. Increments the version of the play queue. Returns the modified
    /// play queue.
    @discardableResult
    public func deletePlayQueueItem(
        playQueueId: Int,
        playQueueItemId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeletePlayQueueItem(
            playQueueId: playQueueId,
            playQueueItemId: playQueueItemId
        ))
    }

    /// Retrieves the play queue, centered at current item. This can be treated as a regular container
    /// by play queue-oblivious clients, but they may wish to request a large window onto the queue
    /// since they won't know to refresh.
    @discardableResult
    public func getPlayQueue(
        playQueueId: Int,
        own: BoolInt? = nil,
        center: String? = nil,
        window: Int? = nil,
        includeBefore: BoolInt? = nil,
        includeAfter: BoolInt? = nil
    ) async throws(PlexError) -> PlayQueueResponse {
        try await client.perform(Operations.GetPlayQueue(
            playQueueId: playQueueId,
            own: own,
            center: center,
            window: window,
            includeBefore: includeBefore,
            includeAfter: includeAfter
        ))
    }

    /// Moves an item in a play queue, and increases the version of the play queue. Returns the modified
    /// play queue.
    @discardableResult
    public func movePlayQueueItem(
        playQueueId: Int,
        playQueueItemId: Int,
        after: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.MovePlayQueueItem(
            playQueueId: playQueueId,
            playQueueItemId: playQueueItemId,
            after: after
        ))
    }

    /// Reset a play queue to the first item being the current item
    @discardableResult
    public func resetPlayQueue(
        playQueueId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.ResetPlayQueue(
            playQueueId: playQueueId
        ))
    }

    /// Shuffle a play queue (or reshuffles if already shuffled). The currently selected item is
    /// maintained. Note that this is currently only supported for play queues *without* an Up Next
    /// area. Returns the modified play queue.
    @discardableResult
    public func shuffle(
        playQueueId: Int
    ) async throws(PlexError) -> MediaContainerWithPlaylistMetadata {
        try await client.perform(Operations.Shuffle(
            playQueueId: playQueueId
        ))
    }

    /// Unshuffles a play queue and restores "natural order". Note that this is currently only supported
    /// for play queues *without* an Up Next area. Returns the modified play queue.
    @discardableResult
    public func unshuffle(
        playQueueId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.Unshuffle(
            playQueueId: playQueueId
        ))
    }
}

extension PlexClient {
    /// The `Play Queue` operations of the Plex API.
    public var playQueue: PlayQueueAPI { PlayQueueAPI(client: self) }
}
