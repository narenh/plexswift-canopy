// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct WebhookPayloadPlayer: Codable, Hashable, Sendable {
    public let title: String?

    public let local: Bool?

    public let publicAddress: String?

    public let uuid: String?

    public init(
        title: String? = nil,
        local: Bool? = nil,
        publicAddress: String? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.local = local
        self.publicAddress = publicAddress
        self.uuid = uuid
    }
}
