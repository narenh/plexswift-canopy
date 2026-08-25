// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A feature supported by a media provider.
public struct ListProvidersResponse: Codable, Hashable, Sendable {
    public let mediaContainer: ListProvidersResponseMediaContainer?

    /// Human-readable feature title.
    public let title: String?

    /// Feature type.
    public let type: String?

    /// Feature key identifier.
    public let key: ListProvidersResponseKey?

    public init(
        mediaContainer: ListProvidersResponseMediaContainer? = nil,
        title: String? = nil,
        type: String? = nil,
        key: ListProvidersResponseKey? = nil
    ) {
        self.mediaContainer = mediaContainer
        self.title = title
        self.type = type
        self.key = key
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
        case title
        case type
        case key
    }
}
