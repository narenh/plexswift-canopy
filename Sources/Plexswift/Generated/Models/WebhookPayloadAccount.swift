// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct WebhookPayloadAccount: Codable, Hashable, Sendable {
    public let title: String?

    public let id: Int?

    public let thumb: String?

    public init(
        title: String? = nil,
        id: Int? = nil,
        thumb: String? = nil
    ) {
        self.title = title
        self.id = id
        self.thumb = thumb
    }
}
