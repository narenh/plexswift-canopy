// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct UserPlexAccountServicesItem: Codable, Hashable, Sendable {
    public let endpoint: String?

    public let identifier: String?

    public let secret: String?

    public let status: UserPlexAccountServicesItemStatus?

    public let token: String?

    public init(
        endpoint: String? = nil,
        identifier: String? = nil,
        secret: String? = nil,
        status: UserPlexAccountServicesItemStatus? = nil,
        token: String? = nil
    ) {
        self.endpoint = endpoint
        self.identifier = identifier
        self.secret = secret
        self.status = status
        self.token = token
    }
}
