// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ServerAccessTokensResponseAccessTokensItem: Codable, Hashable, Sendable {
    public let expiresAt: String?

    public let scope: String?

    public let token: String?

    public init(
        expiresAt: String? = nil,
        scope: String? = nil,
        token: String? = nil
    ) {
        self.expiresAt = expiresAt
        self.scope = scope
        self.token = token
    }
}
