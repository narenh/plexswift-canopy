// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ModifyPlaylistGeneratorItem: Codable, Hashable, Sendable {
    public let title: String?

    public let type: Int?

    public let location: ModifyPlaylistGeneratorItemLocation?

    public let locationID: Int?

    public let policy: ModifyPlaylistGeneratorItemPolicy?

    public let target: String?

    public let targetTagID: Int?

    public init(
        title: String? = nil,
        type: Int? = nil,
        location: ModifyPlaylistGeneratorItemLocation? = nil,
        locationID: Int? = nil,
        policy: ModifyPlaylistGeneratorItemPolicy? = nil,
        target: String? = nil,
        targetTagID: Int? = nil
    ) {
        self.title = title
        self.type = type
        self.location = location
        self.locationID = locationID
        self.policy = policy
        self.target = target
        self.targetTagID = targetTagID
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case location = "Location"
        case locationID
        case policy = "Policy"
        case target
        case targetTagID
    }
}
