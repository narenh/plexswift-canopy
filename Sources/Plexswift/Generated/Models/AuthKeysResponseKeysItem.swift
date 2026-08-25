// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct AuthKeysResponseKeysItem: Codable, Hashable, Sendable {
    public let alg: String?

    public let e: String?

    public let kid: String?

    public let kty: String?

    public let n: String?

    public let use: String?

    public init(
        alg: String? = nil,
        e: String? = nil,
        kid: String? = nil,
        kty: String? = nil,
        n: String? = nil,
        use: String? = nil
    ) {
        self.alg = alg
        self.e = e
        self.kid = kid
        self.kty = kty
        self.n = n
        self.use = use
    }
}
