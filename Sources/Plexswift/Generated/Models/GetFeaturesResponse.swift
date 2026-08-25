// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetFeaturesResponse: Codable, Hashable, Sendable {
    public let type: String?

    public let directory: [Directory]?

    public let key: String?

    public init(
        type: String? = nil,
        directory: [Directory]? = nil,
        key: String? = nil
    ) {
        self.type = type
        self.directory = directory
        self.key = key
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case directory = "Directory"
        case key
    }
}
