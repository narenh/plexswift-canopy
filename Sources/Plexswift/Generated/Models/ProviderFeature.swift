// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A feature supported by a media provider.
public struct ProviderFeature: Codable, Hashable, Sendable {
    /// Human-readable feature title.
    public let title: String?

    /// Feature type.
    public let type: String?

    /// Feature key identifier.
    public let key: ProviderFeatureKey?

    public init(
        title: String? = nil,
        type: String? = nil,
        key: ProviderFeatureKey? = nil
    ) {
        self.title = title
        self.type = type
        self.key = key
    }
}
