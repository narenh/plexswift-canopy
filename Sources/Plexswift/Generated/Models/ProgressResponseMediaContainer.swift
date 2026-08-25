// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ProgressResponseMediaContainer: Codable, Hashable, Sendable {
    public let size: Int?

    public let video: [Metadata]?

    public init(
        size: Int? = nil,
        video: [Metadata]? = nil
    ) {
        self.size = size
        self.video = video
    }

    private enum CodingKeys: String, CodingKey {
        case size
        case video = "Video"
    }
}
