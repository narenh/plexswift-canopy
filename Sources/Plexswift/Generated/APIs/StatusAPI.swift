// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Status` operations of the Plex API.
///
/// Reached through ``PlexClient/status``.
public struct StatusAPI: Sendable {
    let client: PlexClient

    /// Delete a single history item by id
    @discardableResult
    public func deleteHistory(
        historyId: Int
    ) async throws(PlexError) -> MediaContainer {
        try await client.perform(Operations.DeleteHistory(
            historyId: historyId
        ))
    }

    /// Get the list of all background tasks
    @discardableResult
    public func getBackgroundTasks() async throws(PlexError) -> GetBackgroundTasksResponse {
        try await client.perform(Operations.GetBackgroundTasks())
    }

    /// Get a single history item by id
    @discardableResult
    public func getHistoryItem(
        historyId: Int
    ) async throws(PlexError) -> PlaybackHistoryMetadata {
        try await client.perform(Operations.GetHistoryItem(
            historyId: historyId
        ))
    }

    /// List all playback history (Admin can see all users, others can only see their own).
    /// Pagination should be used on this endpoint. Additionally this endpoint supports `includeFields`,
    /// `excludeFields`, `includeElements`, and `excludeElements` parameters.
    @discardableResult
    public func listPlaybackHistory(
        xPlexContainerStart: Int? = nil,
        xPlexContainerSize: Int? = nil,
        accountID: Int? = nil,
        viewedAt: Int? = nil,
        librarySectionID: Int? = nil,
        metadataItemID: Int? = nil,
        sort: [String]? = nil,
        excludeElements: String? = nil,
        excludeFields: String? = nil,
        includeFields: String? = nil,
        includeElements: String? = nil,
        viewedAt2: Int? = nil,
        viewedAt3: Int? = nil,
        deviceID: Int? = nil
    ) async throws(PlexError) -> ListPlaybackHistoryResponse {
        try await client.perform(Operations.ListPlaybackHistory(
            xPlexContainerStart: xPlexContainerStart,
            xPlexContainerSize: xPlexContainerSize,
            accountID: accountID,
            viewedAt: viewedAt,
            librarySectionID: librarySectionID,
            metadataItemID: metadataItemID,
            sort: sort,
            excludeElements: excludeElements,
            excludeFields: excludeFields,
            includeFields: includeFields,
            includeElements: includeElements,
            viewedAt2: viewedAt2,
            viewedAt3: viewedAt3,
            deviceID: deviceID
        ))
    }

    /// List all current playbacks on this server
    @discardableResult
    public func listSessions() async throws(PlexError) -> ListSessionsResponse {
        try await client.perform(Operations.ListSessions())
    }

    /// Terminate a playback session kicking off the user
    @discardableResult
    public func terminateSession(
        sessionId: String,
        reason: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.TerminateSession(
            sessionId: sessionId,
            reason: reason
        ))
    }
}

extension PlexClient {
    /// The `Status` operations of the Plex API.
    public var status: StatusAPI { StatusAPI(client: self) }
}
