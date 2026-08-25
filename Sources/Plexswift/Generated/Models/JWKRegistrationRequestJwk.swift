// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// JSON Web Key for device authentication
public struct JWKRegistrationRequestJwk: Codable, Hashable, Sendable {
    public let crv: String?

    public let kid: String?

    public let kty: String?

    public let x: String?

    public init(
        crv: String? = nil,
        kid: String? = nil,
        kty: String? = nil,
        x: String? = nil
    ) {
        self.crv = crv
        self.kid = kid
        self.kty = kty
        self.x = x
    }
}
