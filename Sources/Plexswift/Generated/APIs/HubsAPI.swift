// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Hubs` operations of the Plex API.
///
/// Reached through ``PlexClient/hubs``.
public struct HubsAPI: Sendable {
    let client: PlexClient

    /// Create a custom hub based on a metadata item
    @discardableResult
    public func createCustomHub(
        sectionId: Int,
        metadataItemId: Int,
        promotedToRecommended: BoolInt? = nil,
        promotedToOwnHome: BoolInt? = nil,
        promotedToSharedHome: BoolInt? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.CreateCustomHub(
            sectionId: sectionId,
            metadataItemId: metadataItemId,
            promotedToRecommended: promotedToRecommended,
            promotedToOwnHome: promotedToOwnHome,
            promotedToSharedHome: promotedToSharedHome
        ))
    }

    /// Delete a custom hub from the server
    @discardableResult
    public func deleteCustomHub(
        sectionId: Int,
        identifier: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.DeleteCustomHub(
            sectionId: sectionId,
            identifier: identifier
        ))
    }

    /// Get the global hubs in this PMS
    @discardableResult
    public func getAllHubs(
        count: Int? = nil,
        onlyTransient: BoolInt? = nil,
        identifier: [String]? = nil
    ) async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetAllHubs(
            count: count,
            onlyTransient: onlyTransient,
            identifier: identifier
        ))
    }

    /// Get the global continue watching hub
    @discardableResult
    public func getContinueWatching(
        count: Int? = nil
    ) async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetContinueWatching(
            count: count
        ))
    }

    /// Get direct access to Continue Watching items.
    @discardableResult
    public func getContinueWatchingItems() async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetContinueWatchingItems())
    }

    /// Get the recently added hub for the home screen.
    @discardableResult
    public func getHomeRecentlyAdded() async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetHomeRecentlyAdded())
    }

    /// Get the items within a single hub specified by identifier
    @discardableResult
    public func getHubItems(
        count: Int? = nil,
        identifier: [String]
    ) async throws -> GetHubItemsResponse {
        try await client.perform(Operations.GetHubItems(
            count: count,
            identifier: identifier
        ))
    }

    /// Get the hubs for a section by metadata item. Currently only for music sections
    @discardableResult
    public func getMetadataHubs(
        count: Int? = nil,
        metadataId: Int,
        onlyTransient: BoolInt? = nil
    ) async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetMetadataHubs(
            count: count,
            metadataId: metadataId,
            onlyTransient: onlyTransient
        ))
    }

    /// Get the hubs for a metadata to be displayed in post play
    @discardableResult
    public func getPostplayHubs(
        count: Int? = nil,
        metadataId: Int,
        onlyTransient: BoolInt? = nil
    ) async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetPostplayHubs(
            count: count,
            metadataId: metadataId,
            onlyTransient: onlyTransient
        ))
    }

    /// Get the global hubs which are promoted (should be displayed on the home screen)
    @discardableResult
    public func getPromotedHubs(
        count: Int? = nil
    ) async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetPromotedHubs(
            count: count
        ))
    }

    /// Get the hubs for a metadata related to the provided metadata item
    @discardableResult
    public func getRelatedHubs(
        count: Int? = nil,
        metadataId: Int,
        onlyTransient: BoolInt? = nil
    ) async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetRelatedHubs(
            count: count,
            metadataId: metadataId,
            onlyTransient: onlyTransient
        ))
    }

    /// Get the hubs for a single section
    @discardableResult
    public func getSectionHubs(
        count: Int? = nil,
        sectionId: Int,
        onlyTransient: BoolInt? = nil
    ) async throws -> MediaContainerWithHubs {
        try await client.perform(Operations.GetSectionHubs(
            count: count,
            sectionId: sectionId,
            onlyTransient: onlyTransient
        ))
    }

    /// Get the list of hubs including both built-in and custom
    @discardableResult
    public func listHubs(
        sectionId: Int,
        metadataItemId: Int? = nil
    ) async throws -> ListHubsResponse {
        try await client.perform(Operations.ListHubs(
            sectionId: sectionId,
            metadataItemId: metadataItemId
        ))
    }

    /// Changed the ordering of a hub among others hubs
    @discardableResult
    public func moveHub(
        sectionId: Int,
        identifier: String,
        after: String? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.MoveHub(
            sectionId: sectionId,
            identifier: identifier,
            after: after
        ))
    }

    /// Reset hubs for this section to defaults and delete custom hubs
    @discardableResult
    public func resetSectionDefaults(
        sectionId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.ResetSectionDefaults(
            sectionId: sectionId
        ))
    }

    /// Changed the visibility of a hub for both the admin and shared users
    @discardableResult
    public func updateHubVisibility(
        sectionId: Int,
        identifier: String,
        promotedToRecommended: BoolInt? = nil,
        promotedToOwnHome: BoolInt? = nil,
        promotedToSharedHome: BoolInt? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.UpdateHubVisibility(
            sectionId: sectionId,
            identifier: identifier,
            promotedToRecommended: promotedToRecommended,
            promotedToOwnHome: promotedToOwnHome,
            promotedToSharedHome: promotedToSharedHome
        ))
    }
}

extension PlexClient {
    /// The `Hubs` operations of the Plex API.
    public var hubs: HubsAPI { HubsAPI(client: self) }
}
