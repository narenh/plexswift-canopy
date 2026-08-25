// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct AuthNonceResponse: Codable, Hashable, Sendable {
    /// A random nonce string for authentication
    public let nonce: String?

    public init(
        nonce: String? = nil
    ) {
        self.nonce = nonce
    }
}
