// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A media provider registered with the PMS.
public struct Provider: Codable, Hashable, Sendable {
    /// Human-readable provider title.
    public let title: String?

    /// Unique provider identifier.
    public let identifier: String?

    /// Protocol version used by the provider.
    public let `protocol`: String?

    /// Content types provided.
    public let types: String?

    public init(
        title: String? = nil,
        identifier: String? = nil,
        `protocol`: String? = nil,
        types: String? = nil
    ) {
        self.title = title
        self.identifier = identifier
        self.`protocol` = `protocol`
        self.types = types
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case identifier
        case `protocol` = "Protocol"
        case types
    }
}
