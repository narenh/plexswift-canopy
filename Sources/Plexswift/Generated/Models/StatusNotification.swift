// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Server status notification (e.g. library scan complete)
public struct StatusNotification: Codable, Hashable, Sendable {
    public let title: String?

    public let description: String?

    public let type: String?

    public init(
        title: String? = nil,
        description: String? = nil,
        type: String? = nil
    ) {
        self.title = title
        self.description = description
        self.type = type
    }
}
