// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct LegacyPinResponse: Codable, Hashable, Sendable {
    /// The authentication token
    public let authToken: String?

    public let clientIdentifier: String?

    /// The 4-character PIN code
    public let code: String?

    public let expiresIn: Int?

    /// The PIN ID
    public let id: Int?

    public let trusted: Bool?

    public init(
        authToken: String? = nil,
        clientIdentifier: String? = nil,
        code: String? = nil,
        expiresIn: Int? = nil,
        id: Int? = nil,
        trusted: Bool? = nil
    ) {
        self.authToken = authToken
        self.clientIdentifier = clientIdentifier
        self.code = code
        self.expiresIn = expiresIn
        self.id = id
        self.trusted = trusted
    }
}
