// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Timeline` operations of the Plex API.
///
/// Reached through ``PlexClient/timeline``.
public struct TimelineAPI: Sendable {
    let client: PlexClient

    /// Get the conversion/optimization queue.
    @discardableResult
    public func getConversionQueue() async throws(PlexError) -> MediaContainerWithPlayQueue {
        try await client.perform(Operations.GetConversionQueue())
    }

    /// Mark an item as played. Note, this does not create any view history of this item but rather just
    /// sets the state as played. The client must provide either the `key` or `uri` query parameter
    /// This API does respond to the GET verb but applications should use PUT
    @discardableResult
    public func markPlayed(
        identifier: String,
        key: String? = nil,
        uri: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.MarkPlayed(
            identifier: identifier,
            key: key,
            uri: uri
        ))
    }

    /// This endpoint is hit during media playback for an item. It must be hit whenever the play state
    /// changes, or in the absence of a play state change, in a regular fashion (generally this means
    /// every 10 seconds on a LAN/WAN, and every 20 seconds over cellular).
    @discardableResult
    public func report(
        key: String? = nil,
        ratingKey: String? = nil,
        state: ReportState? = nil,
        playQueueItemID: String? = nil,
        time: Int? = nil,
        duration: Int? = nil,
        continuing: BoolInt? = nil,
        updated: Int? = nil,
        offline: BoolInt? = nil,
        timeToFirstFrame: Int? = nil,
        timeStalled: Int? = nil,
        bandwidth: Int? = nil,
        bufferedTime: Int? = nil,
        bufferedSize: Int? = nil,
        containerKey: String? = nil,
        guid: String? = nil,
        playQueueID: Int? = nil,
        url: String? = nil,
        xPlexSessionIdentifier: String? = nil
    ) async throws(PlexError) -> ReportResponse {
        try await client.perform(Operations.Report(
            key: key,
            ratingKey: ratingKey,
            state: state,
            playQueueItemID: playQueueItemID,
            time: time,
            duration: duration,
            continuing: continuing,
            updated: updated,
            offline: offline,
            timeToFirstFrame: timeToFirstFrame,
            timeStalled: timeStalled,
            bandwidth: bandwidth,
            bufferedTime: bufferedTime,
            bufferedSize: bufferedSize,
            containerKey: containerKey,
            guid: guid,
            playQueueID: playQueueID,
            url: url,
            xPlexSessionIdentifier: xPlexSessionIdentifier
        ))
    }

    /// Mark an item as unplayed. The client must provide either the `key` or `uri` query parameter
    /// This API does respond to the GET verb but applications should use PUT
    @discardableResult
    public func unscrobble(
        identifier: String,
        key: String? = nil,
        uri: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.Unscrobble(
            identifier: identifier,
            key: key,
            uri: uri
        ))
    }
}

extension PlexClient {
    /// The `Timeline` operations of the Plex API.
    public var timeline: TimelineAPI { TimelineAPI(client: self) }
}
