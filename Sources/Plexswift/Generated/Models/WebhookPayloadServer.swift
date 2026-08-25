// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct WebhookPayloadServer: Codable, Hashable, Sendable {
    public let title: String?

    public let uuid: String?

    public init(
        title: String? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.uuid = uuid
    }
}
