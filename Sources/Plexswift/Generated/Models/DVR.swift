// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct DVR: Codable, Hashable, Sendable {
    public let device: [Device]?

    public let key: String?

    public let language: String?

    public let lineup: String?

    public let uuid: String?

    public init(
        device: [Device]? = nil,
        key: String? = nil,
        language: String? = nil,
        lineup: String? = nil,
        uuid: String? = nil
    ) {
        self.device = device
        self.key = key
        self.language = language
        self.lineup = lineup
        self.uuid = uuid
    }

    private enum CodingKeys: String, CodingKey {
        case device = "Device"
        case key
        case language
        case lineup
        case uuid
    }
}
