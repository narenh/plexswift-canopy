// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct LinkOAuthPinBody: Codable, Hashable, Sendable {
    public let authToken: String?

    public let pin: String?

    public init(
        authToken: String? = nil,
        pin: String? = nil
    ) {
        self.authToken = authToken
        self.pin = pin
    }
}
