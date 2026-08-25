// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// `Part` represents a particular file or "part" of a media item. The part is the playable unit of
/// the media hierarchy. Suppose that a movie library contains a movie that is broken up into files,
/// reminiscent of a movie split across two BDs. The metadata item represents information about the
/// movie, the media item represents this instance of the movie at this resolution and quality, and
/// the part items represent the two playable files. If another media were added which contained the
/// joining of these two parts transcoded down to a lower resolution, then this metadata would
/// contain 2 medias, one with 2 parts and one with 1 part.
public struct Part: Codable, Hashable, Sendable {
    /// Indicates if the part is accessible.
    public let accessible: Bool?

    public let audioProfile: String?

    /// The container of the media file, such as `mp4` or `mkv`
    public let container: String?

    /// Deep analysis version for this part.
    public let deepAnalysisVersion: Int?

    /// The duration of the media item, in milliseconds
    public let duration: Int?

    /// Indicates if the part exists.
    public let exists: Bool?

    /// The local file path at which the part is stored on the server
    public let file: String?

    public let has64bitOffsets: Bool?

    public let id: Int?

    public let indexes: String?

    /// The key from which the media can be streamed
    public let key: String?

    public let optimizedForStreaming: Bool?

    /// RTP packet length for streaming.
    public let packetLength: Int?

    /// Streaming protocol (e.g. dash, hls, direct).
    public let `protocol`: String?

    /// Comma-separated list of bandwidth requirements.
    public let requiredBandwidths: String?

    /// The size of the media, in bytes
    public let size: Int?

    public let stream: [Stream]?

    /// Mobile sync item association ID.
    public let syncItemId: Int?

    /// Sync state (e.g. pending, downloaded, processing).
    public let syncState: String?

    public let videoProfile: String?

    public init(
        accessible: Bool? = nil,
        audioProfile: String? = nil,
        container: String? = nil,
        deepAnalysisVersion: Int? = nil,
        duration: Int? = nil,
        exists: Bool? = nil,
        file: String? = nil,
        has64bitOffsets: Bool? = nil,
        id: Int? = nil,
        indexes: String? = nil,
        key: String? = nil,
        optimizedForStreaming: Bool? = nil,
        packetLength: Int? = nil,
        protocol: String? = nil,
        requiredBandwidths: String? = nil,
        size: Int? = nil,
        stream: [Stream]? = nil,
        syncItemId: Int? = nil,
        syncState: String? = nil,
        videoProfile: String? = nil
    ) {
        self.accessible = accessible
        self.audioProfile = audioProfile
        self.container = container
        self.deepAnalysisVersion = deepAnalysisVersion
        self.duration = duration
        self.exists = exists
        self.file = file
        self.has64bitOffsets = has64bitOffsets
        self.id = id
        self.indexes = indexes
        self.key = key
        self.optimizedForStreaming = optimizedForStreaming
        self.packetLength = packetLength
        self.`protocol` = `protocol`
        self.requiredBandwidths = requiredBandwidths
        self.size = size
        self.stream = stream
        self.syncItemId = syncItemId
        self.syncState = syncState
        self.videoProfile = videoProfile
    }

    private enum CodingKeys: String, CodingKey {
        case accessible
        case audioProfile
        case container
        case deepAnalysisVersion
        case duration
        case exists
        case file
        case has64bitOffsets
        case id
        case indexes
        case key
        case optimizedForStreaming
        case packetLength
        case `protocol`
        case requiredBandwidths
        case size
        case stream = "Stream"
        case syncItemId
        case syncState
        case videoProfile
    }
}
