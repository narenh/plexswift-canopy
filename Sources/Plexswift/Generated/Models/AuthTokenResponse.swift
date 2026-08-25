// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct AuthTokenResponse: Codable, Hashable, Sendable {
    /// The Plex authentication token
    public let authToken: String?

    public let clientIdentifier: String?

    /// JWT token for device authentication
    public let jwt: String?

    public init(
        authToken: String? = nil,
        clientIdentifier: String? = nil,
        jwt: String? = nil
    ) {
        self.authToken = authToken
        self.clientIdentifier = clientIdentifier
        self.jwt = jwt
    }
}
