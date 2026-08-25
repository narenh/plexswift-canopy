// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct MediaContainerWithArtworkMediaContainerMetadataItem: Codable, Hashable, Sendable {
    /// The title of the item
    public let title: String?

    public let type: MediaContainerWithArtworkMediaContainerMetadataItemType?

    /// The path to the artwork
    public let key: String?

    public init(
        title: String? = nil,
        type: MediaContainerWithArtworkMediaContainerMetadataItemType? = nil,
        key: String? = nil
    ) {
        self.title = title
        self.type = type
        self.key = key
    }
}
