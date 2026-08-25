// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// When found on a show item, indicates that the children (seasons) should be skipped in favor of
/// the grandchildren (episodes). Useful for mini-series, etc.
public enum MediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildren: Codable, Hashable, Sendable {
    case bool(Bool)
    case mediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildrenCase2(MediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildrenCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(MediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildrenCase2.self) {
            self = .mediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildrenCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            MediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildren.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, MediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildrenCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .mediaContainerWithNestedMetadataMediaContainerMetadataItemItemSkipChildrenCase2(let value): try container.encode(value)
        }
    }
}
