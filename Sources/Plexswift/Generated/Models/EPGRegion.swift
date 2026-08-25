// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct EPGRegion: Codable, Hashable, Sendable {
    public let title: String?

    public let type: String?

    public let key: String?

    public let national: Bool?

    public init(
        title: String? = nil,
        type: String? = nil,
        key: String? = nil,
        national: Bool? = nil
    ) {
        self.title = title
        self.type = type
        self.key = key
        self.national = national
    }
}
