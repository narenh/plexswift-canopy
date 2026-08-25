// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ConnectionInfo: Codable, Hashable, Sendable {
    public let accessToken: String?

    public let clientIdentifier: String?

    public let connection: [Connection]?

    public let name: String?

    public init(
        accessToken: String? = nil,
        clientIdentifier: String? = nil,
        connection: [Connection]? = nil,
        name: String? = nil
    ) {
        self.accessToken = accessToken
        self.clientIdentifier = clientIdentifier
        self.connection = connection
        self.name = name
    }

    private enum CodingKeys: String, CodingKey {
        case accessToken
        case clientIdentifier
        case connection = "Connection"
        case name
    }
}
