// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Level: Codable, Hashable, Sendable {
    /// The level in db.
    public let v: Double?

    public init(
        v: Double? = nil
    ) {
        self.v = v
    }
}
