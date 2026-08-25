// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct UserOptOutsResponseOptOutsItem: Codable, Hashable, Sendable {
    public let type: String?

    public let id: String?

    public let value: Bool?

    public init(
        type: String? = nil,
        id: String? = nil,
        value: Bool? = nil
    ) {
        self.type = type
        self.id = id
        self.value = value
    }
}
