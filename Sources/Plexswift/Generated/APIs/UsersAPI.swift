// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Users` operations of the Plex API.
///
/// Reached through ``PlexClient/users``.
public struct UsersAPI: Sendable {
    let client: PlexClient

    /// Accept a pending Plex friend, home, or server invitation.
    @discardableResult
    public func acceptInvite(
        inviteId: Int,
        friend: BoolInt,
        home: BoolInt,
        server: BoolInt
    ) async throws -> EmptyResponse {
        try await client.perform(Operations.AcceptInvite(
            inviteId: inviteId,
            friend: friend,
            home: home,
            server: server
        ))
    }

    /// Create a new Plex Home user.
    @discardableResult
    public func createHomeUser() async throws -> SuccessResponse {
        try await client.perform(Operations.CreateHomeUser())
    }

    /// Remove a Plex Home user.
    @discardableResult
    public func deleteHomeUser(
        userId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.DeleteHomeUser(
            userId: userId
        ))
    }

    /// Get the logged-in user's account details in JSON format (legacy v1 endpoint).
    @discardableResult
    public func getAccountJSON() async throws -> UserPlexAccount {
        try await client.perform(Operations.GetAccountJSON())
    }

    /// Get the logged-in user's account details in XML format (legacy v1 endpoint).
    @discardableResult
    public func getAccountXML() async throws -> EmptyResponse {
        try await client.perform(Operations.GetAccountXML())
    }

    /// Get the list of friends and shared users.
    @discardableResult
    public func getFriends() async throws -> GetFriendsResponse {
        try await client.perform(Operations.GetFriends())
    }

    /// Get Plex Home user list.
    @discardableResult
    public func getHome() async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetHome())
    }

    /// Get the list of Plex Home users.
    @discardableResult
    public func getHomeUsers() async throws -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetHomeUsers())
    }

    /// Get legacy published server connections (XML).
    @discardableResult
    public func getLegacyResources() async throws -> EmptyResponse {
        try await client.perform(Operations.GetLegacyResources())
    }

    /// Get legacy friends list (XML).
    @discardableResult
    public func getLegacyUsers() async throws -> EmptyResponse {
        try await client.perform(Operations.GetLegacyUsers())
    }

    /// Get linked MyPlex account info on PMS.
    @discardableResult
    public func getMyPlexAccount() async throws -> UserPlexAccount {
        try await client.perform(Operations.GetMyPlexAccount())
    }

    /// Get server details for sharing.
    @discardableResult
    public func getServerDetails(
        machineId: String
    ) async throws -> ServerConfiguration {
        try await client.perform(Operations.GetServerDetails(
            machineId: machineId
        ))
    }

    /// Get features enabled per shared user for the server.
    @discardableResult
    public func getServerUserFeatures() async throws -> ServerUserFeaturesResponse {
        try await client.perform(Operations.GetServerUserFeatures())
    }

    /// Get online media source opt-out settings for a user.
    @discardableResult
    public func getUserOptOuts(
        uuid: String
    ) async throws -> UserOptOutsResponse {
        try await client.perform(Operations.GetUserOptOuts(
            uuid: uuid
        ))
    }

    /// Get server association information for the logged-in user.
    @discardableResult
    public func getUserServer() async throws -> ConnectionInfo {
        try await client.perform(Operations.GetUserServer())
    }

    /// Get list of all users that are friends and have library access with the provided Plex
    /// authentication token
    @discardableResult
    public func getUsers() async throws -> GetUsersResponse {
        try await client.perform(Operations.GetUsers())
    }

    /// Remove a share / friend.
    @discardableResult
    public func removeShare(
        userId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.RemoveShare(
            userId: userId
        ))
    }

    /// Share a server with a friend or managed user.
    @discardableResult
    public func shareServer() async throws -> SuccessResponse {
        try await client.perform(Operations.ShareServer())
    }

    /// Share a library with a friend (legacy v1 XML endpoint).
    @discardableResult
    public func shareServerLegacy(
        machineId: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.ShareServerLegacy(
            machineId: machineId
        ))
    }

    /// Update a Plex Home user.
    @discardableResult
    public func updateHomeUser(
        userId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.UpdateHomeUser(
            userId: userId
        ))
    }

    /// Update restricted (managed) home user settings.
    @discardableResult
    public func updateRestrictedUser(
        userId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.UpdateRestrictedUser(
            userId: userId
        ))
    }

    /// Update friend filters (allowSync, filterMovies, etc.).
    @discardableResult
    public func updateShare(
        userId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.UpdateShare(
            userId: userId
        ))
    }

    /// Enable or disable watch-state sync consent for the logged-in user.
    @discardableResult
    public func updateViewStateSync() async throws -> SuccessResponse {
        try await client.perform(Operations.UpdateViewStateSync())
    }
}

extension PlexClient {
    /// The `Users` operations of the Plex API.
    public var users: UsersAPI { UsersAPI(client: self) }
}
