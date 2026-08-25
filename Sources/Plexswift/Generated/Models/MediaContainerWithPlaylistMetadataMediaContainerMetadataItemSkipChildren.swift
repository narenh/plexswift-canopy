// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// When found on a show item, indicates that the children (seasons) should be skipped in favor of
/// the grandchildren (episodes). Useful for mini-series, etc.
public enum MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildren: Codable, Hashable, Sendable {
    case bool(Bool)
    case mediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildrenCase2(MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildrenCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildrenCase2.self) {
            self = .mediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildrenCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildren.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildrenCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .mediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildrenCase2(let value): try container.encode(value)
        }
    }
}
