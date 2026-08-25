// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// `Stream` represents a particular stream from a media item, such as the video stream, audio
/// stream, or subtitle stream. The stream may either be part of the file represented by the parent
/// `Part` or, especially for subtitles, an external file. The stream contains more detailed
/// information about the specific stream. For example, a video may include the `aspectRatio` at the
/// `Media` level, but detailed information about the video stream like the color space will be
/// included on the `Stream` for the video stream. Note that photos do not have streams (mostly as
/// an optimization).
public struct Stream: Codable, Hashable, Sendable {
    /// Optional title for the stream (e.g., language variant).
    public let title: String?

    /// Format of the stream (e.g., srt).
    public let format: String?

    /// Indicates if this stream is default.
    public let `default`: Bool?

    /// ReplayGain album gain in dB.
    public let albumGain: Double?

    /// ReplayGain album peak amplitude.
    public let albumPeak: Double?

    /// ReplayGain album dynamic range in dB.
    public let albumRange: Double?

    /// Audio channel layout.
    public let audioChannelLayout: String?

    /// Bit depth of the video stream.
    public let bitDepth: Int?

    /// Bitrate of the stream.
    public let bitrate: Int?

    /// Audio bitrate mode (cbr or vbr).
    public let bitrateMode: StreamBitrateMode?

    /// Indicates if the stream can auto-sync.
    public let canAutoSync: StreamCanAutoSync?

    /// Number of audio channels (for audio streams).
    public let channels: Int?

    /// Chroma sample location.
    public let chromaLocation: String?

    /// Chroma subsampling format.
    public let chromaSubsampling: String?

    public let closedCaptions: Bool?

    /// Codec used by the stream.
    public let codec: String?

    /// Coded video height.
    public let codedHeight: Int?

    /// Coded video width.
    public let codedWidth: Int?

    /// Color primaries used.
    public let colorPrimaries: String?

    /// Color range (e.g., tv).
    public let colorRange: String?

    /// Color space.
    public let colorSpace: String?

    /// Color transfer characteristics.
    public let colorTrc: String?

    /// Display title for the stream.
    public let displayTitle: String?

    /// Dolby Vision BL compatibility ID.
    public let doviBLCompatID: Int?

    /// Indicates if Dolby Vision BL is present.
    public let doviBLPresent: Bool?

    /// Indicates if Dolby Vision EL is present.
    public let doviELPresent: Bool?

    /// Dolby Vision level.
    public let doviLevel: Int?

    /// Indicates if Dolby Vision is present.
    public let doviPresent: Bool?

    /// Dolby Vision profile.
    public let doviProfile: Int?

    /// Indicates if Dolby Vision RPU is present.
    public let doviRPUPresent: Bool?

    /// Dolby Vision version.
    public let doviVersion: String?

    /// Indicates if the stream is a dub.
    public let dub: Bool?

    public let embeddedInVideo: String?

    /// Loudness ramp end type.
    public let endRamp: String?

    /// Extended display title for the stream.
    public let extendedDisplayTitle: String?

    public let forced: Bool?

    /// Frame rate of the stream.
    public let frameRate: Double?

    /// Track replay gain in dB.
    public let gain: Double?

    public let hasScalingMatrix: Bool?

    /// Indicates whether header compression is enabled.
    public let headerCompression: Bool?

    /// Indicates if the stream is for the hearing impaired.
    public let hearingImpaired: Bool?

    /// Height of the video stream.
    public let height: Int?

    /// Unique stream identifier.
    public let id: Int?

    /// Index of the stream.
    public let index: Int?

    /// Key to access this stream part.
    public let key: String?

    /// Language of the stream.
    public let language: String?

    /// ISO language code.
    public let languageCode: String?

    /// Language tag (e.g., en).
    public let languageTag: String?

    /// Video level.
    public let level: Int?

    /// Integrated loudness in LUFS.
    public let loudness: Double?

    /// Loudness range in LU.
    public let lra: Double?

    /// Minimum lines in the lyric file.
    public let minLines: Int?

    /// Indicates if this is the original stream.
    public let original: Bool?

    /// Track peak amplitude.
    public let peak: Double?

    /// Whether the subtitle is an exact match.
    public let perfectMatch: Bool?

    /// Video profile.
    public let profile: String?

    /// Lyric or subtitle provider name.
    public let provider: String?

    /// Subtitle provider display name.
    public let providerTitle: String?

    /// Number of reference frames.
    public let refFrames: Int?

    /// Sampling rate for the audio stream.
    public let samplingRate: Int?

    public let scanType: String?

    /// Subtitle match confidence score (0-100).
    public let score: Double?

    /// Indicates if this stream is selected (applicable for audio streams).
    public let selected: Bool?

    /// Source identifier for the subtitle.
    public let sourceKey: String?

    /// Loudness ramp start type.
    public let startRamp: String?

    public let streamIdentifier: Int?

    /// Stream type:
    /// - VIDEO = 1 (Video stream)
    /// - AUDIO = 2 (Audio stream)
    /// - SUBTITLE = 3 (Subtitle stream)
    public let streamType: StreamStreamType?

    /// Whether lyrics are timestamped.
    public let timed: Bool?

    /// Whether the subtitle is temporary or downloaded.
    public let transient: Bool?

    /// ID of the user who added the subtitle.
    public let userID: Int?

    /// Whether this audio track is an audio description track.
    public let visualImpaired: Bool?

    /// Width of the video stream.
    public let width: Int?

    public init(
        title: String? = nil,
        format: String? = nil,
        `default`: Bool? = nil,
        albumGain: Double? = nil,
        albumPeak: Double? = nil,
        albumRange: Double? = nil,
        audioChannelLayout: String? = nil,
        bitDepth: Int? = nil,
        bitrate: Int? = nil,
        bitrateMode: StreamBitrateMode? = nil,
        canAutoSync: StreamCanAutoSync? = nil,
        channels: Int? = nil,
        chromaLocation: String? = nil,
        chromaSubsampling: String? = nil,
        closedCaptions: Bool? = nil,
        codec: String? = nil,
        codedHeight: Int? = nil,
        codedWidth: Int? = nil,
        colorPrimaries: String? = nil,
        colorRange: String? = nil,
        colorSpace: String? = nil,
        colorTrc: String? = nil,
        displayTitle: String? = nil,
        doviBLCompatID: Int? = nil,
        doviBLPresent: Bool? = nil,
        doviELPresent: Bool? = nil,
        doviLevel: Int? = nil,
        doviPresent: Bool? = nil,
        doviProfile: Int? = nil,
        doviRPUPresent: Bool? = nil,
        doviVersion: String? = nil,
        dub: Bool? = nil,
        embeddedInVideo: String? = nil,
        endRamp: String? = nil,
        extendedDisplayTitle: String? = nil,
        forced: Bool? = nil,
        frameRate: Double? = nil,
        gain: Double? = nil,
        hasScalingMatrix: Bool? = nil,
        headerCompression: Bool? = nil,
        hearingImpaired: Bool? = nil,
        height: Int? = nil,
        id: Int? = nil,
        index: Int? = nil,
        key: String? = nil,
        language: String? = nil,
        languageCode: String? = nil,
        languageTag: String? = nil,
        level: Int? = nil,
        loudness: Double? = nil,
        lra: Double? = nil,
        minLines: Int? = nil,
        original: Bool? = nil,
        peak: Double? = nil,
        perfectMatch: Bool? = nil,
        profile: String? = nil,
        provider: String? = nil,
        providerTitle: String? = nil,
        refFrames: Int? = nil,
        samplingRate: Int? = nil,
        scanType: String? = nil,
        score: Double? = nil,
        selected: Bool? = nil,
        sourceKey: String? = nil,
        startRamp: String? = nil,
        streamIdentifier: Int? = nil,
        streamType: StreamStreamType? = nil,
        timed: Bool? = nil,
        transient: Bool? = nil,
        userID: Int? = nil,
        visualImpaired: Bool? = nil,
        width: Int? = nil
    ) {
        self.title = title
        self.format = format
        self.`default` = `default`
        self.albumGain = albumGain
        self.albumPeak = albumPeak
        self.albumRange = albumRange
        self.audioChannelLayout = audioChannelLayout
        self.bitDepth = bitDepth
        self.bitrate = bitrate
        self.bitrateMode = bitrateMode
        self.canAutoSync = canAutoSync
        self.channels = channels
        self.chromaLocation = chromaLocation
        self.chromaSubsampling = chromaSubsampling
        self.closedCaptions = closedCaptions
        self.codec = codec
        self.codedHeight = codedHeight
        self.codedWidth = codedWidth
        self.colorPrimaries = colorPrimaries
        self.colorRange = colorRange
        self.colorSpace = colorSpace
        self.colorTrc = colorTrc
        self.displayTitle = displayTitle
        self.doviBLCompatID = doviBLCompatID
        self.doviBLPresent = doviBLPresent
        self.doviELPresent = doviELPresent
        self.doviLevel = doviLevel
        self.doviPresent = doviPresent
        self.doviProfile = doviProfile
        self.doviRPUPresent = doviRPUPresent
        self.doviVersion = doviVersion
        self.dub = dub
        self.embeddedInVideo = embeddedInVideo
        self.endRamp = endRamp
        self.extendedDisplayTitle = extendedDisplayTitle
        self.forced = forced
        self.frameRate = frameRate
        self.gain = gain
        self.hasScalingMatrix = hasScalingMatrix
        self.headerCompression = headerCompression
        self.hearingImpaired = hearingImpaired
        self.height = height
        self.id = id
        self.index = index
        self.key = key
        self.language = language
        self.languageCode = languageCode
        self.languageTag = languageTag
        self.level = level
        self.loudness = loudness
        self.lra = lra
        self.minLines = minLines
        self.original = original
        self.peak = peak
        self.perfectMatch = perfectMatch
        self.profile = profile
        self.provider = provider
        self.providerTitle = providerTitle
        self.refFrames = refFrames
        self.samplingRate = samplingRate
        self.scanType = scanType
        self.score = score
        self.selected = selected
        self.sourceKey = sourceKey
        self.startRamp = startRamp
        self.streamIdentifier = streamIdentifier
        self.streamType = streamType
        self.timed = timed
        self.transient = transient
        self.userID = userID
        self.visualImpaired = visualImpaired
        self.width = width
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case format
        case `default`
        case albumGain
        case albumPeak
        case albumRange
        case audioChannelLayout
        case bitDepth
        case bitrate
        case bitrateMode
        case canAutoSync
        case channels
        case chromaLocation
        case chromaSubsampling
        case closedCaptions
        case codec
        case codedHeight
        case codedWidth
        case colorPrimaries
        case colorRange
        case colorSpace
        case colorTrc
        case displayTitle
        case doviBLCompatID = "DOVIBLCompatID"
        case doviBLPresent = "DOVIBLPresent"
        case doviELPresent = "DOVIELPresent"
        case doviLevel = "DOVILevel"
        case doviPresent = "DOVIPresent"
        case doviProfile = "DOVIProfile"
        case doviRPUPresent = "DOVIRPUPresent"
        case doviVersion = "DOVIVersion"
        case dub
        case embeddedInVideo
        case endRamp
        case extendedDisplayTitle
        case forced
        case frameRate
        case gain
        case hasScalingMatrix
        case headerCompression
        case hearingImpaired
        case height
        case id
        case index
        case key
        case language
        case languageCode
        case languageTag
        case level
        case loudness
        case lra
        case minLines
        case original
        case peak
        case perfectMatch
        case profile
        case provider
        case providerTitle
        case refFrames
        case samplingRate
        case scanType
        case score
        case selected
        case sourceKey
        case startRamp
        case streamIdentifier
        case streamType
        case timed
        case transient
        case userID
        case visualImpaired
        case width
    }
}
