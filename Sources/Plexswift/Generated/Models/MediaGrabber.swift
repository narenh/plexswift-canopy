// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct MediaGrabber: Codable, Hashable, Sendable {
    public let title: String?

    public let identifier: String?

    public let `protocol`: String?

    public init(
        title: String? = nil,
        identifier: String? = nil,
        protocol: String? = nil
    ) {
        self.title = title
        self.identifier = identifier
        self.`protocol` = `protocol`
    }
}
