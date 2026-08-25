// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct TranscodeJob: Codable, Hashable, Sendable {
    public let title: String?

    public let type: TranscodeJobType?

    public let generatorID: Int?

    public let key: String?

    public let progress: Double?

    public let ratingKey: String?

    /// The number of seconds remaining in this job
    public let remaining: Int?

    /// The size of the result so far
    public let size: Int?

    /// The speed of the transcode; 1.0 means real-time
    public let speed: Double?

    /// The tag associated with the job. This could be the tag containing the optimizer settings.
    public let targetTagID: Int?

    public let thumb: String?

    public init(
        title: String? = nil,
        type: TranscodeJobType? = nil,
        generatorID: Int? = nil,
        key: String? = nil,
        progress: Double? = nil,
        ratingKey: String? = nil,
        remaining: Int? = nil,
        size: Int? = nil,
        speed: Double? = nil,
        targetTagID: Int? = nil,
        thumb: String? = nil
    ) {
        self.title = title
        self.type = type
        self.generatorID = generatorID
        self.key = key
        self.progress = progress
        self.ratingKey = ratingKey
        self.remaining = remaining
        self.size = size
        self.speed = speed
        self.targetTagID = targetTagID
        self.thumb = thumb
    }
}
