// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PlexDownloadsResponseMediaContainer: Codable, Hashable, Sendable {
    public let directory: [Directory]?

    public let size: Int?

    public init(
        directory: [Directory]? = nil,
        size: Int? = nil
    ) {
        self.directory = directory
        self.size = size
    }

    private enum CodingKeys: String, CodingKey {
        case directory = "Directory"
        case size
    }
}
