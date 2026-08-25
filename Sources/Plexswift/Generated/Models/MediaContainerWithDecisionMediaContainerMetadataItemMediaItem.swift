// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// `Media` represents an one or more media files (parts) and is a child of a metadata item. There
/// aren't necessarily any guaranteed attributes on media elements since the attributes will vary
/// based on the type. The possible attributes are not documented here, but they typically have
/// self-evident names. High-level media information that can be used for badging and flagging, such
/// as `videoResolution` and codecs, is included on the media element.
public struct MediaContainerWithDecisionMediaContainerMetadataItemMediaItem: Codable, Hashable, Sendable {
    public let aspectRatio: Double?

    public let audioChannels: Int?

    public let audioCodec: String?

    public let audioProfile: String?

    public let bitrate: Int?

    public let container: String?

    public let duration: Int?

    public let has64bitOffsets: Bool?

    /// Voice activity detection availability flag returned by PMS.
    /// PMS may return this as a boolean or as string values (`"0"` or `"1"`).
    public let hasVoiceActivity: MediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivity?

    public let height: Int?

    public let id: Int?

    public let optimizedForStreaming: MediaContainerWithDecisionMediaContainerMetadataItemMediaItemOptimizedForStreaming?

    public let part: [MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItem]?

    public let selected: Bool?

    /// Unique identifier for this media instance.
    public let uuid: String?

    public let videoCodec: String?

    public let videoFrameRate: String?

    public let videoProfile: String?

    public let videoResolution: String?

    public let width: Int?

    public let abr: Bool?

    public let resourceSession: String?

    public init(
        aspectRatio: Double? = nil,
        audioChannels: Int? = nil,
        audioCodec: String? = nil,
        audioProfile: String? = nil,
        bitrate: Int? = nil,
        container: String? = nil,
        duration: Int? = nil,
        has64bitOffsets: Bool? = nil,
        hasVoiceActivity: MediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivity? = nil,
        height: Int? = nil,
        id: Int? = nil,
        optimizedForStreaming: MediaContainerWithDecisionMediaContainerMetadataItemMediaItemOptimizedForStreaming? = nil,
        part: [MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItem]? = nil,
        selected: Bool? = nil,
        uuid: String? = nil,
        videoCodec: String? = nil,
        videoFrameRate: String? = nil,
        videoProfile: String? = nil,
        videoResolution: String? = nil,
        width: Int? = nil,
        abr: Bool? = nil,
        resourceSession: String? = nil
    ) {
        self.aspectRatio = aspectRatio
        self.audioChannels = audioChannels
        self.audioCodec = audioCodec
        self.audioProfile = audioProfile
        self.bitrate = bitrate
        self.container = container
        self.duration = duration
        self.has64bitOffsets = has64bitOffsets
        self.hasVoiceActivity = hasVoiceActivity
        self.height = height
        self.id = id
        self.optimizedForStreaming = optimizedForStreaming
        self.part = part
        self.selected = selected
        self.uuid = uuid
        self.videoCodec = videoCodec
        self.videoFrameRate = videoFrameRate
        self.videoProfile = videoProfile
        self.videoResolution = videoResolution
        self.width = width
        self.abr = abr
        self.resourceSession = resourceSession
    }

    private enum CodingKeys: String, CodingKey {
        case aspectRatio
        case audioChannels
        case audioCodec
        case audioProfile
        case bitrate
        case container
        case duration
        case has64bitOffsets
        case hasVoiceActivity
        case height
        case id
        case optimizedForStreaming
        case part = "Part"
        case selected
        case uuid
        case videoCodec
        case videoFrameRate
        case videoProfile
        case videoResolution
        case width
        case abr
        case resourceSession
    }
}
