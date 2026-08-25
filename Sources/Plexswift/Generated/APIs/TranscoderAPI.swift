// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Transcoder` operations of the Plex API.
///
/// Reached through ``PlexClient/transcoder``.
public struct TranscoderAPI: Sendable {
    let client: PlexClient

    /// DASH segment delivery for adaptive streaming.
    @discardableResult
    public func getDASHSegment(
        transcodeType: String,
        sessionId: String,
        segmentId: String
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetDASHSegment(
            transcodeType: transcodeType,
            sessionId: sessionId,
            segmentId: segmentId
        ))
    }

    /// HLS TS segment delivery for adaptive streaming.
    @discardableResult
    public func getHLSSegment(
        transcodeType: String,
        sessionId: String,
        segmentId: String
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetHLSSegment(
            transcodeType: transcodeType,
            sessionId: sessionId,
            segmentId: segmentId
        ))
    }

    /// Get active transcode sessions.
    @discardableResult
    public func getTranscodeSessions() async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetTranscodeSessions())
    }

    /// Make a decision on media playback based on client profile, and requested settings such as
    /// bandwidth and resolution.
    @discardableResult
    public func makeDecision(
        transcodeType: MakeDecisionTranscodeType,
        transcodeSessionId: String? = nil,
        advancedSubtitles: MakeDecisionAdvancedSubtitles? = nil,
        platform: String? = nil,
        audioBoost: Int? = nil,
        audioChannelCount: Int? = nil,
        autoAdjustQuality: BoolInt? = nil,
        autoAdjustSubtitle: BoolInt? = nil,
        directPlay: BoolInt? = nil,
        directStream: BoolInt? = nil,
        directStreamAudio: BoolInt? = nil,
        disableResolutionRotation: BoolInt? = nil,
        hasMDE: BoolInt? = nil,
        location: MakeDecisionLocation? = nil,
        mediaBufferSize: Int? = nil,
        mediaIndex: Int? = nil,
        musicBitrate: Int? = nil,
        offset: Double? = nil,
        partIndex: Int? = nil,
        path2: String? = nil,
        peakBitrate: Int? = nil,
        photoResolution: String? = nil,
        protocol: MakeDecisionProtocol? = nil,
        secondsPerSegment: Int? = nil,
        subtitleSize: Int? = nil,
        subtitles: MakeDecisionSubtitles? = nil,
        maxVideoBitrate: Int? = nil,
        videoResolution: String? = nil,
        copyts: BoolInt? = nil,
        videoBitrate: Int? = nil,
        videoQuality: Int? = nil,
        xPlexClientProfileExtra: String? = nil,
        xPlexClientProfileName: String? = nil,
        xPlexSessionIdentifier: String? = nil
    ) async throws(PlexError) -> MediaContainerWithDecision {
        try await client.perform(Operations.MakeDecision(
            transcodeType: transcodeType,
            transcodeSessionId: transcodeSessionId,
            advancedSubtitles: advancedSubtitles,
            platform: platform,
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
            maxVideoBitrate: maxVideoBitrate,
            videoResolution: videoResolution,
            copyts: copyts,
            videoBitrate: videoBitrate,
            videoQuality: videoQuality,
            xPlexClientProfileExtra: xPlexClientProfileExtra,
            xPlexClientProfileName: xPlexClientProfileName,
            xPlexSessionIdentifier: xPlexSessionIdentifier
        ))
    }

    /// Starts the transcoder and returns the corresponding streaming resource document.
    @discardableResult
    public func startTranscodeSession(
        transcodeType: StartTranscodeSessionTranscodeType,
        transcodeSessionId: String? = nil,
        advancedSubtitles: StartTranscodeSessionAdvancedSubtitles? = nil,
        platform: String? = nil,
        extension: StartTranscodeSessionExtension,
        audioBoost: Int? = nil,
        audioChannelCount: Int? = nil,
        autoAdjustQuality: BoolInt? = nil,
        autoAdjustSubtitle: BoolInt? = nil,
        directPlay: BoolInt? = nil,
        directStream: BoolInt? = nil,
        directStreamAudio: BoolInt? = nil,
        disableResolutionRotation: BoolInt? = nil,
        hasMDE: BoolInt? = nil,
        location: StartTranscodeSessionLocation? = nil,
        mediaBufferSize: Int? = nil,
        mediaIndex: Int? = nil,
        musicBitrate: Int? = nil,
        offset: Double? = nil,
        partIndex: Int? = nil,
        path2: String? = nil,
        peakBitrate: Int? = nil,
        photoResolution: String? = nil,
        protocol: StartTranscodeSessionProtocol? = nil,
        secondsPerSegment: Int? = nil,
        subtitleSize: Int? = nil,
        subtitles: StartTranscodeSessionSubtitles? = nil,
        maxVideoBitrate: Int? = nil,
        videoResolution: String? = nil,
        copyts: BoolInt? = nil,
        videoBitrate: Int? = nil,
        videoQuality: Int? = nil,
        xPlexClientProfileExtra: String? = nil,
        xPlexClientProfileName: String? = nil,
        xPlexSessionIdentifier: String? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.StartTranscodeSession(
            transcodeType: transcodeType,
            transcodeSessionId: transcodeSessionId,
            advancedSubtitles: advancedSubtitles,
            platform: platform,
            extension: `extension`,
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
            maxVideoBitrate: maxVideoBitrate,
            videoResolution: videoResolution,
            copyts: copyts,
            videoBitrate: videoBitrate,
            videoQuality: videoQuality,
            xPlexClientProfileExtra: xPlexClientProfileExtra,
            xPlexClientProfileName: xPlexClientProfileName,
            xPlexSessionIdentifier: xPlexSessionIdentifier
        ))
    }

    /// Transcode an image, possibly changing format or size
    @discardableResult
    public func transcodeImage(
        url: String? = nil,
        format: TranscodeImageFormat? = nil,
        width: Int? = nil,
        height: Int? = nil,
        quality: Int? = nil,
        background: String? = nil,
        upscale: BoolInt? = nil,
        minSize: BoolInt? = nil,
        rotate: BoolInt? = nil,
        blur: Int? = nil,
        saturation: Int? = nil,
        opacity: Int? = nil,
        chromaSubsampling: TranscodeImageChromaSubsampling? = nil,
        blendColor: String? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.TranscodeImage(
            url: url,
            format: format,
            width: width,
            height: height,
            quality: quality,
            background: background,
            upscale: upscale,
            minSize: minSize,
            rotate: rotate,
            blur: blur,
            saturation: saturation,
            opacity: opacity,
            chromaSubsampling: chromaSubsampling,
            blendColor: blendColor
        ))
    }

    /// Audio transcode endpoint for music playback.
    @discardableResult
    public func transcodeMusic() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.TranscodeMusic())
    }

    /// Only transcode subtitle streams.
    @discardableResult
    public func transcodeSubtitles(
        transcodeType: TranscodeSubtitlesTranscodeType,
        transcodeSessionId: String? = nil,
        advancedSubtitles: TranscodeSubtitlesAdvancedSubtitles? = nil,
        platform: String? = nil,
        audioBoost: Int? = nil,
        audioChannelCount: Int? = nil,
        autoAdjustQuality: BoolInt? = nil,
        autoAdjustSubtitle: BoolInt? = nil,
        directPlay: BoolInt? = nil,
        directStream: BoolInt? = nil,
        directStreamAudio: BoolInt? = nil,
        disableResolutionRotation: BoolInt? = nil,
        hasMDE: BoolInt? = nil,
        location: TranscodeSubtitlesLocation? = nil,
        mediaBufferSize: Int? = nil,
        mediaIndex: Int? = nil,
        musicBitrate: Int? = nil,
        offset: Double? = nil,
        partIndex: Int? = nil,
        path2: String? = nil,
        peakBitrate: Int? = nil,
        photoResolution: String? = nil,
        protocol: TranscodeSubtitlesProtocol? = nil,
        secondsPerSegment: Int? = nil,
        subtitleSize: Int? = nil,
        subtitles: TranscodeSubtitlesSubtitles? = nil,
        maxVideoBitrate: Int? = nil,
        videoResolution: String? = nil,
        copyts: BoolInt? = nil,
        videoBitrate: Int? = nil,
        videoQuality: Int? = nil,
        xPlexClientProfileExtra: String? = nil,
        xPlexClientProfileName: String? = nil,
        xPlexSessionIdentifier: String? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.TranscodeSubtitles(
            transcodeType: transcodeType,
            transcodeSessionId: transcodeSessionId,
            advancedSubtitles: advancedSubtitles,
            platform: platform,
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
            maxVideoBitrate: maxVideoBitrate,
            videoResolution: videoResolution,
            copyts: copyts,
            videoBitrate: videoBitrate,
            videoQuality: videoQuality,
            xPlexClientProfileExtra: xPlexClientProfileExtra,
            xPlexClientProfileName: xPlexClientProfileName,
            xPlexSessionIdentifier: xPlexSessionIdentifier
        ))
    }

    /// Manually trigger a transcoder fallback ex: HEVC to h.264 or hw to sw
    @discardableResult
    public func triggerFallback(
        transcodeType: TriggerFallbackTranscodeType,
        transcodeSessionId: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.TriggerFallback(
            transcodeType: transcodeType,
            transcodeSessionId: transcodeSessionId
        ))
    }
}

extension PlexClient {
    /// The `Transcoder` operations of the Plex API.
    public var transcoder: TranscoderAPI { TranscoderAPI(client: self) }
}
