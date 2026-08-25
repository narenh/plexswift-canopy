// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct TokenExchangeRequest: Codable, Hashable, Sendable {
    /// Unique client identifier
    public let clientIdentifier: String?

    /// JWT token to exchange for a Plex auth token
    public let jwt: String?

    /// Requested scope for the token
    public let scope: String?

    public init(
        clientIdentifier: String? = nil,
        jwt: String? = nil,
        scope: String? = nil
    ) {
        self.clientIdentifier = clientIdentifier
        self.jwt = jwt
        self.scope = scope
    }
}
