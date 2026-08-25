// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Subscriptions` operations of the Plex API.
///
/// Reached through ``PlexClient/subscriptions``.
public struct SubscriptionsAPI: Sendable {
    let client: PlexClient

    /// Cancels an existing media grab (recording). It can be used to resolve a conflict which exists
    /// for a rolling subscription.
    /// Note: This cancellation does not persist across a server restart, but neither does a rolling
    /// subscription itself.
    @discardableResult
    public func cancelGrab(
        operationId: String
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.CancelGrab(
            operationId: operationId
        ))
    }

    /// Create a subscription. The query parameters should be mostly derived from the
    /// [template](#tag/Subscriptions/operation/mediaSubscriptionsGetTemplate)
    @discardableResult
    public func createSubscription(
        targetLibrarySectionID: Int? = nil,
        targetSectionLocationID: Int? = nil,
        type: Int? = nil,
        hints: AnyJSON? = nil,
        prefs: AnyJSON? = nil,
        params: AnyJSON? = nil
    ) async throws(PlexError) -> CreateSubscriptionResponse {
        try await client.perform(Operations.CreateSubscription(
            targetLibrarySectionID: targetLibrarySectionID,
            targetSectionLocationID: targetSectionLocationID,
            type: type,
            hints: hints,
            prefs: prefs,
            params: params
        ))
    }

    /// Delete a subscription, cancelling all of its grabs as well
    @discardableResult
    public func deleteSubscription(
        subscriptionId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteSubscription(
            subscriptionId: subscriptionId
        ))
    }

    /// Edit a subscription's preferences
    @discardableResult
    public func editSubscriptionPreferences(
        subscriptionId: Int,
        prefs: AnyJSON? = nil
    ) async throws(PlexError) -> MediaContainerWithSubscription {
        try await client.perform(Operations.EditSubscriptionPreferences(
            subscriptionId: subscriptionId,
            prefs: prefs
        ))
    }

    /// Get all subscriptions and potentially the grabs too
    @discardableResult
    public func getAllSubscriptions(
        includeGrabs: BoolInt? = nil,
        includeStorage: BoolInt? = nil,
        xPlexContainerStart: Int? = nil,
        xPlexContainerSize: Int? = nil
    ) async throws(PlexError) -> MediaContainerWithSubscription {
        try await client.perform(Operations.GetAllSubscriptions(
            includeGrabs: includeGrabs,
            includeStorage: includeStorage,
            xPlexContainerStart: xPlexContainerStart,
            xPlexContainerSize: xPlexContainerSize
        ))
    }

    /// Get all scheduled recordings across all subscriptions
    @discardableResult
    public func getScheduledRecordings() async throws(PlexError) -> MediaContainerWithMediaGrabOperation {
        try await client.perform(Operations.GetScheduledRecordings())
    }

    /// Get a single subscription and potentially the grabs too
    @discardableResult
    public func getSubscription(
        subscriptionId: Int,
        includeGrabs: BoolInt? = nil,
        includeStorage: BoolInt? = nil
    ) async throws(PlexError) -> MediaContainerWithSubscription {
        try await client.perform(Operations.GetSubscription(
            subscriptionId: subscriptionId,
            includeGrabs: includeGrabs,
            includeStorage: includeStorage
        ))
    }

    /// Get the templates for a piece of media which could include fetching one airing, season, the
    /// whole show, etc.
    @discardableResult
    public func getTemplate(
        guid: String? = nil,
        type: String? = nil,
        targetLibrarySectionID: Int? = nil
    ) async throws(PlexError) -> GetTemplateResponse {
        try await client.perform(Operations.GetTemplate(
            guid: guid,
            type: type,
            targetLibrarySectionID: targetLibrarySectionID
        ))
    }

    /// Process all subscriptions asynchronously
    @discardableResult
    public func processSubscriptions() async throws(PlexError) -> EmptyResponse {
        try await client.perform(Operations.ProcessSubscriptions())
    }

    /// Re-order a subscription to change its priority
    @discardableResult
    public func reorderSubscription(
        subscriptionId: Int,
        after: Int? = nil
    ) async throws(PlexError) -> MediaContainerWithSubscription {
        try await client.perform(Operations.ReorderSubscription(
            subscriptionId: subscriptionId,
            after: after
        ))
    }
}

extension PlexClient {
    /// The `Subscriptions` operations of the Plex API.
    public var subscriptions: SubscriptionsAPI { SubscriptionsAPI(client: self) }
}
