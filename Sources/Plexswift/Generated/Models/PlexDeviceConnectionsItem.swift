// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PlexDeviceConnectionsItem: Codable, Hashable, Sendable {
    /// The (ip) address or domain name used for the connection
    public let address: String?

    /// If the connection is using IPv6
    public let ipv6: Bool?

    /// If the connection is local address
    public let local: Bool?

    /// The port used for the connection
    public let port: Int?

    /// The protocol used for the connection (http, https, etc)
    public let `protocol`: PlexDeviceConnectionsItemProtocol?

    /// If the connection is relayed through plex.direct
    public let relay: Bool?

    /// The full URI of the connection
    public let uri: String?

    public init(
        address: String? = nil,
        ipv6: Bool? = nil,
        local: Bool? = nil,
        port: Int? = nil,
        protocol: PlexDeviceConnectionsItemProtocol? = nil,
        relay: Bool? = nil,
        uri: String? = nil
    ) {
        self.address = address
        self.ipv6 = ipv6
        self.local = local
        self.port = port
        self.`protocol` = `protocol`
        self.relay = relay
        self.uri = uri
    }

    private enum CodingKeys: String, CodingKey {
        case address
        case ipv6 = "IPv6"
        case local
        case port
        case `protocol`
        case relay
        case uri
    }
}
