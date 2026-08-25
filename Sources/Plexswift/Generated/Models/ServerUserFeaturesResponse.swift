// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ServerUserFeaturesResponse: Codable, Hashable, Sendable {
    public let features: [Feature]?

    public init(
        features: [Feature]? = nil
    ) {
        self.features = features
    }
}
