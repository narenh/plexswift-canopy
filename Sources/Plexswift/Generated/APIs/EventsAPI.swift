// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Events` operations of the Plex API.
///
/// Reached through ``PlexClient/events``.
public struct EventsAPI: Sendable {
    let client: PlexClient

    /// Connect to the web socket to get a stream of events
    @discardableResult
    public func connectWebSocket(
        filter: [String]? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.ConnectWebSocket(
            filter: filter
        ))
    }

    /// Connect to the event source to get a stream of events
    @discardableResult
    public func getNotifications(
        filter: [String]? = nil
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetNotifications(
            filter: filter
        ))
    }

    /// WebSocket endpoint for real-time notifications (plural alias). Connect with X-Plex-Token header.
    /// Delivers NotificationContainer messages.
    @discardableResult
    public func getWebsocketNotifications() async throws(PlexError) -> EmptyResponse {
        try await client.perform(Operations.GetWebsocketNotifications())
    }
}

extension PlexClient {
    /// The `Events` operations of the Plex API.
    public var events: EventsAPI { EventsAPI(client: self) }
}
