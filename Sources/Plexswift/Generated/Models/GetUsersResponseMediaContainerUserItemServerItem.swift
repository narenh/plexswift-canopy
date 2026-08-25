// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetUsersResponseMediaContainerUserItemServerItem: Codable, Hashable, Sendable {
    /// Indicates if the user has access to all libraries.
    public let allLibraries: GetUsersResponseMediaContainerUserItemServerItemAllLibraries?

    /// Unique ID of the server of the connected user
    public let id: Int?

    /// Unix epoch datetime in seconds
    public let lastSeenAt: PlexDateTime?

    /// Machine identifier of the Plex server.
    public let machineIdentifier: String?

    /// Name of the Plex server of the connected user.
    public let name: String?

    /// Number of libraries in the server this user has access to.
    public let numLibraries: Int?

    /// Indicates if the user owns the server.
    public let owned: GetUsersResponseMediaContainerUserItemServerItemOwned?

    /// Indicates if the server is pending approval.
    public let pending: GetUsersResponseMediaContainerUserItemServerItemPending?

    /// ID of the actual Plex server.
    public let serverId: Int?

    public init(
        allLibraries: GetUsersResponseMediaContainerUserItemServerItemAllLibraries? = nil,
        id: Int? = nil,
        lastSeenAt: PlexDateTime? = nil,
        machineIdentifier: String? = nil,
        name: String? = nil,
        numLibraries: Int? = nil,
        owned: GetUsersResponseMediaContainerUserItemServerItemOwned? = nil,
        pending: GetUsersResponseMediaContainerUserItemServerItemPending? = nil,
        serverId: Int? = nil
    ) {
        self.allLibraries = allLibraries
        self.id = id
        self.lastSeenAt = lastSeenAt
        self.machineIdentifier = machineIdentifier
        self.name = name
        self.numLibraries = numLibraries
        self.owned = owned
        self.pending = pending
        self.serverId = serverId
    }
}
