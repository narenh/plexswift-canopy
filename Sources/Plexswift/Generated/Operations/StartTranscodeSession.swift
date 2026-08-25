// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Starts the transcoder and returns the corresponding streaming resource document.
    public struct StartTranscodeSession: PlexOperation {
        public typealias Success = Data

        public static let operationID = "startTranscodeSession"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Type of transcode media
        public var transcodeType: StartTranscodeSessionTranscodeType

        /// Transcode session UUID
        public var transcodeSessionId: String?

        /// Indicates how incompatible advanced subtitles (such as ass/ssa) should be included: * 'burn' -
        /// Burn incompatible advanced text subtitles into the video stream * 'text' - Transcode
        /// incompatible advanced text subtitles to a compatible text format, even if some markup is lost
        public var advancedSubtitles: StartTranscodeSessionAdvancedSubtitles?

        /// Client platform (some clients send this in addition to headers).
        public var platform: String?

        /// Extension
        public var `extension`: StartTranscodeSessionExtension

        /// Percentage of original audio loudness to use when transcoding (100 is equivalent to original
        /// volume, 50 is half, 200 is double, etc)
        public var audioBoost: Int?

        /// Target video number of audio channels.
        public var audioChannelCount: Int?

        /// Indicates the client supports ABR.
        public var autoAdjustQuality: BoolInt?

        /// Indicates if the server should adjust subtitles based on Voice Activity Data.
        public var autoAdjustSubtitle: BoolInt?

        /// Indicates the client supports direct playing the indicated content.
        public var directPlay: BoolInt?

        /// Indicates the client supports direct streaming the video of the indicated content.
        public var directStream: BoolInt?

        /// Indicates the client supports direct streaming the audio of the indicated content.
        public var directStreamAudio: BoolInt?

        /// Indicates if resolution should be adjusted for orientation.
        public var disableResolutionRotation: BoolInt?

        /// Ignore client profiles when determining if direct play is possible. Only has an effect when
        /// directPlay=1 and both mediaIndex and partIndex are specified and neither are -1
        public var hasMDE: BoolInt?

        /// Network type of the client, can be used to help determine target bitrate.
        public var location: StartTranscodeSessionLocation?

        /// Buffer size used in playback (in KB). Clients should specify a lower bound if not known exactly.
        /// This value could make the difference between transcoding and direct play on bandwidth
        /// constrained networks.
        public var mediaBufferSize: Int?

        /// Index of the media to transcode. -1 or not specified indicates let the server choose.
        public var mediaIndex: Int?

        /// Target bitrate for audio only files (in kbps, used to transcode).
        public var musicBitrate: Int?

        /// Offset from the start of the media (in seconds).
        public var offset: Double?

        /// Index of the part to transcode. -1 or not specified indicates the server should join parts
        /// together in a transcode
        public var partIndex: Int?

        /// Internal PMS path of the media to transcode.
        public var path2: String?

        /// Maximum bitrate (in kbps) to use in ABR.
        public var peakBitrate: Int?

        /// Target photo resolution.
        public var photoResolution: String?

        /// Indicates the network streaming protocol to be used for the transcode session: * 'http' -
        /// include the file in the http response such as MKV streaming * 'hls' - hls stream (RFC 8216) *
        /// 'dash' - dash stream (ISO/IEC 23009-1:2022)
        public var `protocol`: StartTranscodeSessionProtocol?

        /// Number of seconds to include in each transcoded segment
        public var secondsPerSegment: Int?

        /// Percentage of original subtitle size to use when burning subtitles (100 is equivalent to
        /// original size, 50 is half, ect)
        public var subtitleSize: Int?

        /// Indicates how subtitles should be included: * 'auto' - Compute the appropriate subtitle setting
        /// automatically * 'burn' - Burn the selected subtitle; auto if no selected subtitle * 'none' -
        /// Ignore all subtitle streams * 'sidecar' - The selected subtitle should be provided as a sidecar
        /// * 'embedded' - The selected subtitle should be provided as an embedded stream * 'segmented' -
        /// The selected subtitle should be provided as a segmented stream
        public var subtitles: StartTranscodeSessionSubtitles?

        /// Client-side maximum video bitrate cap in kbps
        public var maxVideoBitrate: Int?

        /// Cap resolution string (e.g. 1920x1080)
        public var videoResolution: String?

        /// Copy timestamps instead of re-encoding them
        public var copyts: BoolInt?

        /// Target video bitrate (in kbps).
        public var videoBitrate: Int?

        /// Target photo quality.
        public var videoQuality: Int?

        /// See [Profile Augmentations](#section/API-Info/Profile-Augmentations) .
        public var xPlexClientProfileExtra: String?

        /// Which built in Client Profile to use in the decision. Generally should only be used to specify
        /// the Generic profile.
        public var xPlexClientProfileName: String?

        /// Unique per client playback session. Used if a client can playback multiple items at a time (such
        /// as a browser with multiple tabs)
        public var xPlexSessionIdentifier: String?

        public init(
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
        ) {
            self.transcodeType = transcodeType
            self.transcodeSessionId = transcodeSessionId
            self.advancedSubtitles = advancedSubtitles
            self.platform = platform
            self.`extension` = `extension`
            self.audioBoost = audioBoost
            self.audioChannelCount = audioChannelCount
            self.autoAdjustQuality = autoAdjustQuality
            self.autoAdjustSubtitle = autoAdjustSubtitle
            self.directPlay = directPlay
            self.directStream = directStream
            self.directStreamAudio = directStreamAudio
            self.disableResolutionRotation = disableResolutionRotation
            self.hasMDE = hasMDE
            self.location = location
            self.mediaBufferSize = mediaBufferSize
            self.mediaIndex = mediaIndex
            self.musicBitrate = musicBitrate
            self.offset = offset
            self.partIndex = partIndex
            self.path2 = path2
            self.peakBitrate = peakBitrate
            self.photoResolution = photoResolution
            self.`protocol` = `protocol`
            self.secondsPerSegment = secondsPerSegment
            self.subtitleSize = subtitleSize
            self.subtitles = subtitles
            self.maxVideoBitrate = maxVideoBitrate
            self.videoResolution = videoResolution
            self.copyts = copyts
            self.videoBitrate = videoBitrate
            self.videoQuality = videoQuality
            self.xPlexClientProfileExtra = xPlexClientProfileExtra
            self.xPlexClientProfileName = xPlexClientProfileName
            self.xPlexSessionIdentifier = xPlexSessionIdentifier
        }

        public var path: String { "/\(PathComponent(transcodeType))/:/transcode/universal/start.\(PathComponent(`extension`))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = transcodeSessionId {
                items.append(URLQueryItem(name: "transcodeSessionId", value: QueryValue(value).encoded))
            }
            if let value = advancedSubtitles {
                items.append(URLQueryItem(name: "advancedSubtitles", value: QueryValue(value).encoded))
            }
            if let value = platform {
                items.append(URLQueryItem(name: "platform", value: QueryValue(value).encoded))
            }
            if let value = audioBoost {
                items.append(URLQueryItem(name: "audioBoost", value: QueryValue(value).encoded))
            }
            if let value = audioChannelCount {
                items.append(URLQueryItem(name: "audioChannelCount", value: QueryValue(value).encoded))
            }
            if let value = autoAdjustQuality {
                items.append(URLQueryItem(name: "autoAdjustQuality", value: QueryValue(value).encoded))
            }
            if let value = autoAdjustSubtitle {
                items.append(URLQueryItem(name: "autoAdjustSubtitle", value: QueryValue(value).encoded))
            }
            if let value = directPlay {
                items.append(URLQueryItem(name: "directPlay", value: QueryValue(value).encoded))
            }
            if let value = directStream {
                items.append(URLQueryItem(name: "directStream", value: QueryValue(value).encoded))
            }
            if let value = directStreamAudio {
                items.append(URLQueryItem(name: "directStreamAudio", value: QueryValue(value).encoded))
            }
            if let value = disableResolutionRotation {
                items.append(URLQueryItem(name: "disableResolutionRotation", value: QueryValue(value).encoded))
            }
            if let value = hasMDE {
                items.append(URLQueryItem(name: "hasMDE", value: QueryValue(value).encoded))
            }
            if let value = location {
                items.append(URLQueryItem(name: "location", value: QueryValue(value).encoded))
            }
            if let value = mediaBufferSize {
                items.append(URLQueryItem(name: "mediaBufferSize", value: QueryValue(value).encoded))
            }
            if let value = mediaIndex {
                items.append(URLQueryItem(name: "mediaIndex", value: QueryValue(value).encoded))
            }
            if let value = musicBitrate {
                items.append(URLQueryItem(name: "musicBitrate", value: QueryValue(value).encoded))
            }
            if let value = offset {
                items.append(URLQueryItem(name: "offset", value: QueryValue(value).encoded))
            }
            if let value = partIndex {
                items.append(URLQueryItem(name: "partIndex", value: QueryValue(value).encoded))
            }
            if let value = path2 {
                items.append(URLQueryItem(name: "path", value: QueryValue(value).encoded))
            }
            if let value = peakBitrate {
                items.append(URLQueryItem(name: "peakBitrate", value: QueryValue(value).encoded))
            }
            if let value = photoResolution {
                items.append(URLQueryItem(name: "photoResolution", value: QueryValue(value).encoded))
            }
            if let value = `protocol` {
                items.append(URLQueryItem(name: "protocol", value: QueryValue(value).encoded))
            }
            if let value = secondsPerSegment {
                items.append(URLQueryItem(name: "secondsPerSegment", value: QueryValue(value).encoded))
            }
            if let value = subtitleSize {
                items.append(URLQueryItem(name: "subtitleSize", value: QueryValue(value).encoded))
            }
            if let value = subtitles {
                items.append(URLQueryItem(name: "subtitles", value: QueryValue(value).encoded))
            }
            if let value = maxVideoBitrate {
                items.append(URLQueryItem(name: "maxVideoBitrate", value: QueryValue(value).encoded))
            }
            if let value = videoResolution {
                items.append(URLQueryItem(name: "videoResolution", value: QueryValue(value).encoded))
            }
            if let value = copyts {
                items.append(URLQueryItem(name: "copyts", value: QueryValue(value).encoded))
            }
            if let value = videoBitrate {
                items.append(URLQueryItem(name: "videoBitrate", value: QueryValue(value).encoded))
            }
            if let value = videoQuality {
                items.append(URLQueryItem(name: "videoQuality", value: QueryValue(value).encoded))
            }
            return items
        }

        public var headers: [String: String] {
            var headers: [String: String] = [:]
            if let value = xPlexClientProfileExtra {
                headers["X-Plex-Client-Profile-Extra"] = QueryValue(value).encoded
            }
            if let value = xPlexClientProfileName {
                headers["X-Plex-Client-Profile-Name"] = QueryValue(value).encoded
            }
            if let value = xPlexSessionIdentifier {
                headers["X-Plex-Session-Identifier"] = QueryValue(value).encoded
            }
            return headers
        }
    }
}
