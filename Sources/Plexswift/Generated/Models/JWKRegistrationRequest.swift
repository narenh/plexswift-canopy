// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct JWKRegistrationRequest: Codable, Hashable, Sendable {
    /// JSON Web Key for device authentication
    public let jwk: JWKRegistrationRequestJwk?

    /// Request strong authentication
    public let strong: Bool?

    public init(
        jwk: JWKRegistrationRequestJwk? = nil,
        strong: Bool? = nil
    ) {
        self.jwk = jwk
        self.strong = strong
    }
}
