// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// `MediaContainer` is the root element of most Plex API responses. It serves as a generic
/// container for various types of content (Metadata, Hubs, Directories, etc.) and includes
/// pagination information (offset, size, totalSize) when applicable.
/// Common attributes: - identifier: Unique identifier for this container - size: Number of items in
/// this response page - totalSize: Total number of items available (for pagination) - offset:
/// Starting index of this page (for pagination)
/// The container often "hoists" common attributes from its children. For example, if all tracks in
/// a container share the same album title, the `parentTitle` attribute may appear on the
/// MediaContainer rather than being repeated on each track.
public struct GetServerInfoResponse: Codable, Hashable, Sendable {
    public let identifier: String?

    /// The offset of where this container page starts among the total objects available. Also provided
    /// in the `X-Plex-Container-Start` header.
    public let offset: Int?

    public let size: Int?

    /// The total size of objects available. Also provided in the `X-Plex-Container-Total-Size` header.
    public let totalSize: Int?

    public let allowCameraUpload: Bool?

    public let allowChannelAccess: Bool?

    public let allowMediaDeletion: Bool?

    public let allowSharing: Bool?

    public let allowSync: Bool?

    public let allowTuners: Bool?

    public let backgroundProcessing: Bool?

    public let certificate: Bool?

    public let companionProxy: Bool?

    public let countryCode: String?

    /// Comma-separated list of enabled diagnostics modules.
    public let diagnostics: [String]?

    public let eventStream: Bool?

    public let friendlyName: String?

    public let hubSearch: Bool?

    public let itemClusters: Bool?

    public let livetv: Int?

    public let machineIdentifier: AnyJSON?

    public let mediaProviders: Bool?

    public let multiuser: Bool?

    public let musicAnalysis: Int?

    public let myPlex: Bool?

    public let myPlexMappingState: AnyJSON?

    public let myPlexSigninState: AnyJSON?

    public let myPlexSubscription: Bool?

    public let myPlexUsername: String?

    /// Whether offline transcoding is enabled.
    public let offlineTranscode: Int?

    /// List of enabled owner features.
    public let ownerFeatures: [String]?

    public let platform: String?

    public let platformVersion: String?

    public let pluginHost: Bool?

    public let pushNotifications: Bool?

    public let readOnlyLibraries: Bool?

    public let streamingBrainABRVersion: Int?

    public let streamingBrainVersion: Int?

    public let sync: Bool?

    public let transcoderActiveVideoSessions: Int?

    public let transcoderAudio: Bool?

    public let transcoderLyrics: Bool?

    public let transcoderPhoto: Bool?

    public let transcoderSubtitles: Bool?

    public let transcoderVideo: Bool?

    /// List of supported transcoder video bitrates.
    public let transcoderVideoBitrates: [String]?

    /// List of supported transcoder video qualities.
    public let transcoderVideoQualities: [String]?

    /// List of supported transcoder video resolutions.
    public let transcoderVideoResolutions: [String]?

    public let updatedAt: Int?

    public let updater: Bool?

    public let version: String?

    public let voiceSearch: Bool?

    public let directory: [Directory]?

    public init(
        identifier: String? = nil,
        offset: Int? = nil,
        size: Int? = nil,
        totalSize: Int? = nil,
        allowCameraUpload: Bool? = nil,
        allowChannelAccess: Bool? = nil,
        allowMediaDeletion: Bool? = nil,
        allowSharing: Bool? = nil,
        allowSync: Bool? = nil,
        allowTuners: Bool? = nil,
        backgroundProcessing: Bool? = nil,
        certificate: Bool? = nil,
        companionProxy: Bool? = nil,
        countryCode: String? = nil,
        diagnostics: [String]? = nil,
        eventStream: Bool? = nil,
        friendlyName: String? = nil,
        hubSearch: Bool? = nil,
        itemClusters: Bool? = nil,
        livetv: Int? = nil,
        machineIdentifier: AnyJSON? = nil,
        mediaProviders: Bool? = nil,
        multiuser: Bool? = nil,
        musicAnalysis: Int? = nil,
        myPlex: Bool? = nil,
        myPlexMappingState: AnyJSON? = nil,
        myPlexSigninState: AnyJSON? = nil,
        myPlexSubscription: Bool? = nil,
        myPlexUsername: String? = nil,
        offlineTranscode: Int? = nil,
        ownerFeatures: [String]? = nil,
        platform: String? = nil,
        platformVersion: String? = nil,
        pluginHost: Bool? = nil,
        pushNotifications: Bool? = nil,
        readOnlyLibraries: Bool? = nil,
        streamingBrainABRVersion: Int? = nil,
        streamingBrainVersion: Int? = nil,
        sync: Bool? = nil,
        transcoderActiveVideoSessions: Int? = nil,
        transcoderAudio: Bool? = nil,
        transcoderLyrics: Bool? = nil,
        transcoderPhoto: Bool? = nil,
        transcoderSubtitles: Bool? = nil,
        transcoderVideo: Bool? = nil,
        transcoderVideoBitrates: [String]? = nil,
        transcoderVideoQualities: [String]? = nil,
        transcoderVideoResolutions: [String]? = nil,
        updatedAt: Int? = nil,
        updater: Bool? = nil,
        version: String? = nil,
        voiceSearch: Bool? = nil,
        directory: [Directory]? = nil
    ) {
        self.identifier = identifier
        self.offset = offset
        self.size = size
        self.totalSize = totalSize
        self.allowCameraUpload = allowCameraUpload
        self.allowChannelAccess = allowChannelAccess
        self.allowMediaDeletion = allowMediaDeletion
        self.allowSharing = allowSharing
        self.allowSync = allowSync
        self.allowTuners = allowTuners
        self.backgroundProcessing = backgroundProcessing
        self.certificate = certificate
        self.companionProxy = companionProxy
        self.countryCode = countryCode
        self.diagnostics = diagnostics
        self.eventStream = eventStream
        self.friendlyName = friendlyName
        self.hubSearch = hubSearch
        self.itemClusters = itemClusters
        self.livetv = livetv
        self.machineIdentifier = machineIdentifier
        self.mediaProviders = mediaProviders
        self.multiuser = multiuser
        self.musicAnalysis = musicAnalysis
        self.myPlex = myPlex
        self.myPlexMappingState = myPlexMappingState
        self.myPlexSigninState = myPlexSigninState
        self.myPlexSubscription = myPlexSubscription
        self.myPlexUsername = myPlexUsername
        self.offlineTranscode = offlineTranscode
        self.ownerFeatures = ownerFeatures
        self.platform = platform
        self.platformVersion = platformVersion
        self.pluginHost = pluginHost
        self.pushNotifications = pushNotifications
        self.readOnlyLibraries = readOnlyLibraries
        self.streamingBrainABRVersion = streamingBrainABRVersion
        self.streamingBrainVersion = streamingBrainVersion
        self.sync = sync
        self.transcoderActiveVideoSessions = transcoderActiveVideoSessions
        self.transcoderAudio = transcoderAudio
        self.transcoderLyrics = transcoderLyrics
        self.transcoderPhoto = transcoderPhoto
        self.transcoderSubtitles = transcoderSubtitles
        self.transcoderVideo = transcoderVideo
        self.transcoderVideoBitrates = transcoderVideoBitrates
        self.transcoderVideoQualities = transcoderVideoQualities
        self.transcoderVideoResolutions = transcoderVideoResolutions
        self.updatedAt = updatedAt
        self.updater = updater
        self.version = version
        self.voiceSearch = voiceSearch
        self.directory = directory
    }

    private enum CodingKeys: String, CodingKey {
        case identifier
        case offset
        case size
        case totalSize
        case allowCameraUpload
        case allowChannelAccess
        case allowMediaDeletion
        case allowSharing
        case allowSync
        case allowTuners
        case backgroundProcessing
        case certificate
        case companionProxy
        case countryCode
        case diagnostics
        case eventStream
        case friendlyName
        case hubSearch
        case itemClusters
        case livetv
        case machineIdentifier
        case mediaProviders
        case multiuser
        case musicAnalysis
        case myPlex
        case myPlexMappingState
        case myPlexSigninState
        case myPlexSubscription
        case myPlexUsername
        case offlineTranscode
        case ownerFeatures
        case platform
        case platformVersion
        case pluginHost
        case pushNotifications
        case readOnlyLibraries
        case streamingBrainABRVersion
        case streamingBrainVersion
        case sync
        case transcoderActiveVideoSessions
        case transcoderAudio
        case transcoderLyrics
        case transcoderPhoto
        case transcoderSubtitles
        case transcoderVideo
        case transcoderVideoBitrates
        case transcoderVideoQualities
        case transcoderVideoResolutions
        case updatedAt
        case updater
        case version
        case voiceSearch
        case directory = "Directory"
    }
}
