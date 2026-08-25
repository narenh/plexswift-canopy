// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Playback` operations of the Plex API.
///
/// Reached through ``PlexClient/playback``.
public struct PlaybackAPI: Sendable {
    let client: PlexClient

    /// Get client capabilities and device info.
    @discardableResult
    public func getClientResources(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.GetClientResources(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Get or update watch progress for a media item.
    @discardableResult
    public func getProgress(
        key: String,
        time: Int
    ) async throws(PlexError) -> ProgressResponse {
        try await client.perform(Operations.GetProgress(
            key: key,
            time: time
        ))
    }

    /// Change the active audio stream.
    @discardableResult
    public func playerAudioStream(
        xPlexTargetClientIdentifier: String? = nil,
        streamID: Int? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.PlayerAudioStream(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            streamID: streamID
        ))
    }

    /// Mute the client audio
    @discardableResult
    public func playerMute(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerMute(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Pause playback on the client
    @discardableResult
    public func playerPause(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerPause(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Start playback on the client
    @discardableResult
    public func playerPlay(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerPlay(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Play a specific media item on the client.
    @discardableResult
    public func playerPlayMedia(
        xPlexTargetClientIdentifier: String? = nil,
        key: String? = nil,
        offset: Int? = nil,
        machineIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerPlayMedia(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            key: key,
            offset: offset,
            machineIdentifier: machineIdentifier
        ))
    }

    /// Poll the client for current playback timeline.
    @discardableResult
    public func playerPollTimeline(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerPollTimeline(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Refresh the play queue on the client
    @discardableResult
    public func playerRefreshplayqueue(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerRefreshplayqueue(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Seek to a specific time in the current playback.
    @discardableResult
    public func playerSeek(
        xPlexTargetClientIdentifier: String? = nil,
        offset: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerSeek(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            offset: offset
        ))
    }

    /// Set shuffle, repeat, and volume parameters.
    @discardableResult
    public func playerSetParameters(
        xPlexTargetClientIdentifier: String? = nil,
        shuffle: PlayerSetParametersShuffle? = nil,
        repeat: PlayerSetParametersRepeat? = nil,
        volume: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerSetParameters(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            shuffle: shuffle,
            repeat: `repeat`,
            volume: volume
        ))
    }

    /// Rate the currently playing item.
    @discardableResult
    public func playerSetRating(
        xPlexTargetClientIdentifier: String? = nil,
        rating: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerSetRating(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            rating: rating
        ))
    }

    /// Set the playback state directly.
    @discardableResult
    public func playerSetState(
        xPlexTargetClientIdentifier: String? = nil,
        state: PlayerSetStateState? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerSetState(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            state: state
        ))
    }

    /// Set active audio, subtitle, and video streams.
    @discardableResult
    public func playerSetStreams(
        xPlexTargetClientIdentifier: String? = nil,
        audioStreamID: Int? = nil,
        subtitleStreamID: Int? = nil,
        videoStreamID: Int? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.PlayerSetStreams(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            audioStreamID: audioStreamID,
            subtitleStreamID: subtitleStreamID,
            videoStreamID: videoStreamID
        ))
    }

    /// Set the active text stream.
    @discardableResult
    public func playerSetTextStream(
        xPlexTargetClientIdentifier: String? = nil,
        streamID: Int? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.PlayerSetTextStream(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            streamID: streamID
        ))
    }

    /// Set the resume offset for the current item.
    @discardableResult
    public func playerSetViewOffset(
        xPlexTargetClientIdentifier: String? = nil,
        offset: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerSetViewOffset(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            offset: offset
        ))
    }

    /// Skip forward or backward by a number of items.
    @discardableResult
    public func playerSkipBy(
        xPlexTargetClientIdentifier: String? = nil,
        offset: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerSkipBy(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            offset: offset
        ))
    }

    /// Skip to a specific item in the play queue.
    @discardableResult
    public func playerSkipTo(
        xPlexTargetClientIdentifier: String? = nil,
        key: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerSkipTo(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            key: key
        ))
    }

    /// Step back one frame
    @discardableResult
    public func playerStepback(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerStepback(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Step forward one frame
    @discardableResult
    public func playerStepforward(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerStepforward(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Stop playback on the client
    @discardableResult
    public func playerStop(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerStop(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Change the active subtitle stream.
    @discardableResult
    public func playerSubtitleStream(
        xPlexTargetClientIdentifier: String? = nil,
        streamID: Int? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.PlayerSubtitleStream(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            streamID: streamID
        ))
    }

    /// Unmute the client audio
    @discardableResult
    public func playerUnmute(
        xPlexTargetClientIdentifier: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerUnmute(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier
        ))
    }

    /// Change the active video stream.
    @discardableResult
    public func playerVideoStream(
        xPlexTargetClientIdentifier: String? = nil,
        streamID: Int? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.PlayerVideoStream(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            streamID: streamID
        ))
    }

    /// Set the client volume.
    @discardableResult
    public func playerVolume(
        xPlexTargetClientIdentifier: String? = nil,
        level: Int? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PlayerVolume(
            xPlexTargetClientIdentifier: xPlexTargetClientIdentifier,
            level: level
        ))
    }

    /// Remove an item from the Continue Watching list.
    @discardableResult
    public func removeFromContinueWatching(
        key: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RemoveFromContinueWatching(
            key: key
        ))
    }
}

extension PlexClient {
    /// The `Playback` operations of the Plex API.
    public var playback: PlaybackAPI { PlaybackAPI(client: self) }
}
