// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetPlaylistGeneratorResponseMediaContainerItemItemMediaSettings: Codable, Hashable, Sendable {
    public let advancedSubtitles: GetPlaylistGeneratorResponseMediaContainerItemItemMediaSettingsAdvancedSubtitles?

    public let audioBoost: Int?

    public let audioChannelCount: Int?

    public let autoAdjustQuality: Bool?

    public let autoAdjustSubtitle: Bool?

    public let directPlay: Bool?

    public let directStream: Bool?

    public let directStreamAudio: Bool?

    public let disableResolutionRotation: Bool?

    public let maxVideoBitrate: Int?

    public let musicBitrate: Int?

    public let peakBitrate: Int?

    public let photoQuality: Int?

    public let photoResolution: String?

    public let secondsPerSegment: Int?

    public let subtitles: GetPlaylistGeneratorResponseMediaContainerItemItemMediaSettingsSubtitles?

    public let subtitleSize: Int?

    public let videoBitrate: Int?

    public let videoQuality: Int?

    public let videoResolution: String?

    public init(
        advancedSubtitles: GetPlaylistGeneratorResponseMediaContainerItemItemMediaSettingsAdvancedSubtitles? = nil,
        audioBoost: Int? = nil,
        audioChannelCount: Int? = nil,
        autoAdjustQuality: Bool? = nil,
        autoAdjustSubtitle: Bool? = nil,
        directPlay: Bool? = nil,
        directStream: Bool? = nil,
        directStreamAudio: Bool? = nil,
        disableResolutionRotation: Bool? = nil,
        maxVideoBitrate: Int? = nil,
        musicBitrate: Int? = nil,
        peakBitrate: Int? = nil,
        photoQuality: Int? = nil,
        photoResolution: String? = nil,
        secondsPerSegment: Int? = nil,
        subtitles: GetPlaylistGeneratorResponseMediaContainerItemItemMediaSettingsSubtitles? = nil,
        subtitleSize: Int? = nil,
        videoBitrate: Int? = nil,
        videoQuality: Int? = nil,
        videoResolution: String? = nil
    ) {
        self.advancedSubtitles = advancedSubtitles
        self.audioBoost = audioBoost
        self.audioChannelCount = audioChannelCount
        self.autoAdjustQuality = autoAdjustQuality
        self.autoAdjustSubtitle = autoAdjustSubtitle
        self.directPlay = directPlay
        self.directStream = directStream
        self.directStreamAudio = directStreamAudio
        self.disableResolutionRotation = disableResolutionRotation
        self.maxVideoBitrate = maxVideoBitrate
        self.musicBitrate = musicBitrate
        self.peakBitrate = peakBitrate
        self.photoQuality = photoQuality
        self.photoResolution = photoResolution
        self.secondsPerSegment = secondsPerSegment
        self.subtitles = subtitles
        self.subtitleSize = subtitleSize
        self.videoBitrate = videoBitrate
        self.videoQuality = videoQuality
        self.videoResolution = videoResolution
    }
}
