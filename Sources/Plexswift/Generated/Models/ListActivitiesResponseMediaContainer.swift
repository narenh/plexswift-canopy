// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ListActivitiesResponseMediaContainer: Codable, Hashable, Sendable {
    public let activity: [Activity]?

    public init(
        activity: [Activity]? = nil
    ) {
        self.activity = activity
    }

    private enum CodingKeys: String, CodingKey {
        case activity = "Activity"
    }
}
