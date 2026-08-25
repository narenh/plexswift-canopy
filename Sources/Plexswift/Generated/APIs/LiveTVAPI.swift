// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Live TV` operations of the Plex API.
///
/// Reached through ``PlexClient/liveTV``.
public struct LiveTVAPI: Sendable {
    let client: PlexClient

    /// Terminate a Live TV session.
    @discardableResult
    public func deleteLiveTVSession(
        sessionId: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.DeleteLiveTVSession(
            sessionId: sessionId
        ))
    }

    /// List completed DVR recordings.
    @discardableResult
    public func getDVRRecordings() async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetDVRRecordings())
    }

    /// List completed DVR recordings for a specific DVR.
    @discardableResult
    public func getDVRRecordingsByDVR(
        dvrId: Int
    ) async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetDVRRecordingsByDVR(
            dvrId: dvrId
        ))
    }

    /// Get a single livetv session and metadata
    @discardableResult
    public func getLiveTVSession(
        sessionId: String
    ) async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetLiveTVSession(
            sessionId: sessionId
        ))
    }

    /// Get a playlist index for playing this session
    @discardableResult
    public func getSessionPlaylistIndex(
        sessionId: String,
        consumerId: String
    ) async throws -> Data {
        try await client.perform(Operations.GetSessionPlaylistIndex(
            sessionId: sessionId,
            consumerId: consumerId
        ))
    }

    /// Get a single LiveTV session segment
    @discardableResult
    public func getSessionSegment(
        sessionId: String,
        consumerId: String,
        segmentId: String
    ) async throws -> Data {
        try await client.perform(Operations.GetSessionSegment(
            sessionId: sessionId,
            consumerId: consumerId,
            segmentId: segmentId
        ))
    }

    /// Get all livetv sessions and metadata
    @discardableResult
    public func getSessions(
        dvrId: Int? = nil,
        channel: Int? = nil
    ) async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetSessions(
            dvrId: dvrId,
            channel: channel
        ))
    }
}

extension PlexClient {
    /// The `Live TV` operations of the Plex API.
    public var liveTV: LiveTVAPI { LiveTVAPI(client: self) }
}
