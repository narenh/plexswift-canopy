// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Information about the player being used for playback
public struct Player: Codable, Hashable, Sendable {
    /// The title of the client
    public let title: String?

    /// The remote address
    public let address: String?

    /// Indicating if the client is playing from the local LAN
    public let local: Bool?

    /// The identifier of the client
    public let machineIdentifier: String?

    /// The model of the client
    public let model: String?

    /// The platform of the client
    public let platform: String?

    /// The platformVersion of the client
    public let platformVersion: String?

    /// The product name of the client
    public let product: String?

    /// Indicating if the client is playing over a relay connection
    public let relayed: Bool?

    /// The client's public address
    public let remotePublicAddress: String?

    /// Indicating if the client is playing over HTTPS
    public let secure: Bool?

    /// The client's last reported state
    public let state: String?

    /// The id of the user
    public let userID: Int?

    /// The vendor of the client
    public let vendor: String?

    /// The version of the client
    public let version: String?

    public init(
        title: String? = nil,
        address: String? = nil,
        local: Bool? = nil,
        machineIdentifier: String? = nil,
        model: String? = nil,
        platform: String? = nil,
        platformVersion: String? = nil,
        product: String? = nil,
        relayed: Bool? = nil,
        remotePublicAddress: String? = nil,
        secure: Bool? = nil,
        state: String? = nil,
        userID: Int? = nil,
        vendor: String? = nil,
        version: String? = nil
    ) {
        self.title = title
        self.address = address
        self.local = local
        self.machineIdentifier = machineIdentifier
        self.model = model
        self.platform = platform
        self.platformVersion = platformVersion
        self.product = product
        self.relayed = relayed
        self.remotePublicAddress = remotePublicAddress
        self.secure = secure
        self.state = state
        self.userID = userID
        self.vendor = vendor
        self.version = version
    }
}
