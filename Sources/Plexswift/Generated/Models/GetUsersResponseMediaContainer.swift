// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Container holding user and server details.
public struct GetUsersResponseMediaContainer: Codable, Hashable, Sendable {
    /// The friendly name of the Plex instance.
    public let friendlyName: String?

    public let identifier: String?

    /// Unique Machine identifier of the Plex server.
    public let machineIdentifier: String?

    /// Number of users in the current response.
    public let size: Int?

    /// Total number of users.
    public let totalSize: Int?

    /// List of users with access to the Plex server.
    public let user: [GetUsersResponseMediaContainerUserItem]?

    public init(
        friendlyName: String? = nil,
        identifier: String? = nil,
        machineIdentifier: String? = nil,
        size: Int? = nil,
        totalSize: Int? = nil,
        user: [GetUsersResponseMediaContainerUserItem]? = nil
    ) {
        self.friendlyName = friendlyName
        self.identifier = identifier
        self.machineIdentifier = machineIdentifier
        self.size = size
        self.totalSize = totalSize
        self.user = user
    }

    private enum CodingKeys: String, CodingKey {
        case friendlyName
        case identifier
        case machineIdentifier
        case size
        case totalSize
        case user = "User"
    }
}
