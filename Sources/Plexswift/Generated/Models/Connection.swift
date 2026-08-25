// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Connection: Codable, Hashable, Sendable {
    public let address: String?

    /// Indicates if the connection is the server's LAN address
    public let local: Bool?

    public let port: Int?

    public let `protocol`: String?

    /// Indicates the connection is over a relayed connection
    public let relay: Bool?

    public let uri: String?

    public init(
        address: String? = nil,
        local: Bool? = nil,
        port: Int? = nil,
        protocol: String? = nil,
        relay: Bool? = nil,
        uri: String? = nil
    ) {
        self.address = address
        self.local = local
        self.port = port
        self.`protocol` = `protocol`
        self.relay = relay
        self.uri = uri
    }
}
