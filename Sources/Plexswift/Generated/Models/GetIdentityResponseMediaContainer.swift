// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetIdentityResponseMediaContainer: Codable, Hashable, Sendable {
    /// Indicates whether this server has been claimed by a user
    public let claimed: Bool?

    /// A unique identifier of the computer
    public let machineIdentifier: String?

    public let size: Int?

    /// The full version string of the PMS
    public let version: String?

    public init(
        claimed: Bool? = nil,
        machineIdentifier: String? = nil,
        size: Int? = nil,
        version: String? = nil
    ) {
        self.claimed = claimed
        self.machineIdentifier = machineIdentifier
        self.size = size
        self.version = version
    }
}
