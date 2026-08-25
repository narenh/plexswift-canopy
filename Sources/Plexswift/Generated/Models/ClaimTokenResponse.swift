// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ClaimTokenResponse: Codable, Hashable, Sendable {
    /// The claim token for server authentication
    public let token: String?

    public init(
        token: String? = nil
    ) {
        self.token = token
    }
}
