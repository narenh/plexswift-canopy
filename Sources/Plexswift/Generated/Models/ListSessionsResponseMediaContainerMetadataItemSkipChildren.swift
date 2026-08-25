// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// When found on a show item, indicates that the children (seasons) should be skipped in favor of
/// the grandchildren (episodes). Useful for mini-series, etc.
public enum ListSessionsResponseMediaContainerMetadataItemSkipChildren: Codable, Hashable, Sendable {
    case bool(Bool)
    case listSessionsResponseMediaContainerMetadataItemSkipChildrenCase2(ListSessionsResponseMediaContainerMetadataItemSkipChildrenCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(ListSessionsResponseMediaContainerMetadataItemSkipChildrenCase2.self) {
            self = .listSessionsResponseMediaContainerMetadataItemSkipChildrenCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            ListSessionsResponseMediaContainerMetadataItemSkipChildren.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, ListSessionsResponseMediaContainerMetadataItemSkipChildrenCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .listSessionsResponseMediaContainerMetadataItemSkipChildrenCase2(let value): try container.encode(value)
        }
    }
}
