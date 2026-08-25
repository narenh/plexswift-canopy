// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct UserOptOutsResponse: Codable, Hashable, Sendable {
    public let optOuts: [UserOptOutsResponseOptOutsItem]?

    public init(
        optOuts: [UserOptOutsResponseOptOutsItem]? = nil
    ) {
        self.optOuts = optOuts
    }
}
