// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The transcode session if item is currently being transcoded
public struct TranscodeSession: Codable, Hashable, Sendable {
    public let complete: Bool?

    public let context: String?

    public let duration: Int?

    public let error: Bool?

    public let key: String?

    public let progress: Double?

    public let `protocol`: String?

    public let size: Int?

    public let sourceAudioCodec: String?

    public let sourceVideoCodec: String?

    public let speed: Double?

    public let throttled: Bool?

    public let transcodeHwFullPipeline: Bool?

    public let transcodeHwRequested: Bool?

    public init(
        complete: Bool? = nil,
        context: String? = nil,
        duration: Int? = nil,
        error: Bool? = nil,
        key: String? = nil,
        progress: Double? = nil,
        protocol: String? = nil,
        size: Int? = nil,
        sourceAudioCodec: String? = nil,
        sourceVideoCodec: String? = nil,
        speed: Double? = nil,
        throttled: Bool? = nil,
        transcodeHwFullPipeline: Bool? = nil,
        transcodeHwRequested: Bool? = nil
    ) {
        self.complete = complete
        self.context = context
        self.duration = duration
        self.error = error
        self.key = key
        self.progress = progress
        self.`protocol` = `protocol`
        self.size = size
        self.sourceAudioCodec = sourceAudioCodec
        self.sourceVideoCodec = sourceVideoCodec
        self.speed = speed
        self.throttled = throttled
        self.transcodeHwFullPipeline = transcodeHwFullPipeline
        self.transcodeHwRequested = transcodeHwRequested
    }
}
