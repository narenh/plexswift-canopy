// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Payload delivered by Plex to configured webhook URLs.
public struct WebhookPayload: Codable, Hashable, Sendable {
    public let account: WebhookPayloadAccount?

    /// Event type that triggered the webhook.
    public let event: WebhookPayloadEvent?

    /// The media item associated with the event. Shape varies by event type.
    public let metadata: AnyJSON?

    public let owner: Bool?

    public let player: WebhookPayloadPlayer?

    public let server: WebhookPayloadServer?

    public let user: Bool?

    public init(
        account: WebhookPayloadAccount? = nil,
        event: WebhookPayloadEvent? = nil,
        metadata: AnyJSON? = nil,
        owner: Bool? = nil,
        player: WebhookPayloadPlayer? = nil,
        server: WebhookPayloadServer? = nil,
        user: Bool? = nil
    ) {
        self.account = account
        self.event = event
        self.metadata = metadata
        self.owner = owner
        self.player = player
        self.server = server
        self.user = user
    }

    private enum CodingKeys: String, CodingKey {
        case account = "Account"
        case event
        case metadata = "Metadata"
        case owner
        case player = "Player"
        case server = "Server"
        case user
    }
}
