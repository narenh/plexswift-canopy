// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct AuthKeysResponse: Codable, Hashable, Sendable {
    public let keys: [AuthKeysResponseKeysItem]?

    public init(
        keys: [AuthKeysResponseKeysItem]? = nil
    ) {
        self.keys = keys
    }
}
