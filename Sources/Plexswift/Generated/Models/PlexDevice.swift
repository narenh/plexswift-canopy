// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PlexDevice: Codable, Hashable, Sendable {
    public let accessToken: String?

    public let clientIdentifier: String?

    public let connections: [PlexDeviceConnectionsItem]?

    /// The time the device was created/registered
    public let createdAt: String?

    public let device: String?

    public let dnsRebindingProtection: Bool?

    public let home: Bool?

    public let httpsRequired: Bool?

    /// The last time the device was seen
    public let lastSeenAt: String?

    public let name: String?

    public let natLoopbackSupported: Bool?

    public let owned: Bool?

    /// ownerId is null when the device is owned by the token used to send the request
    public let ownerId: Int?

    public let platform: String?

    public let platformVersion: String?

    public let presence: Bool?

    public let product: String?

    public let productVersion: String?

    public let provides: String?

    public let publicAddress: String?

    public let publicAddressMatches: Bool?

    public let relay: Bool?

    public let sourceTitle: String?

    public let synced: Bool?

    public init(
        accessToken: String? = nil,
        clientIdentifier: String? = nil,
        connections: [PlexDeviceConnectionsItem]? = nil,
        createdAt: String? = nil,
        device: String? = nil,
        dnsRebindingProtection: Bool? = nil,
        home: Bool? = nil,
        httpsRequired: Bool? = nil,
        lastSeenAt: String? = nil,
        name: String? = nil,
        natLoopbackSupported: Bool? = nil,
        owned: Bool? = nil,
        ownerId: Int? = nil,
        platform: String? = nil,
        platformVersion: String? = nil,
        presence: Bool? = nil,
        product: String? = nil,
        productVersion: String? = nil,
        provides: String? = nil,
        publicAddress: String? = nil,
        publicAddressMatches: Bool? = nil,
        relay: Bool? = nil,
        sourceTitle: String? = nil,
        synced: Bool? = nil
    ) {
        self.accessToken = accessToken
        self.clientIdentifier = clientIdentifier
        self.connections = connections
        self.createdAt = createdAt
        self.device = device
        self.dnsRebindingProtection = dnsRebindingProtection
        self.home = home
        self.httpsRequired = httpsRequired
        self.lastSeenAt = lastSeenAt
        self.name = name
        self.natLoopbackSupported = natLoopbackSupported
        self.owned = owned
        self.ownerId = ownerId
        self.platform = platform
        self.platformVersion = platformVersion
        self.presence = presence
        self.product = product
        self.productVersion = productVersion
        self.provides = provides
        self.publicAddress = publicAddress
        self.publicAddressMatches = publicAddressMatches
        self.relay = relay
        self.sourceTitle = sourceTitle
        self.synced = synced
    }
}
