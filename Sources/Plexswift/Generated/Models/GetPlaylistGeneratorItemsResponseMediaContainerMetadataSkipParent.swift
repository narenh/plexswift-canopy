// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// When present on an episode or track item, indicates parent should be skipped in favor of
/// grandparent (show).
public enum GetPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParent: Codable, Hashable, Sendable {
    case bool(Bool)
    case getPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParentCase2(GetPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParentCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(GetPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParentCase2.self) {
            self = .getPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParentCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            GetPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParent.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, GetPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParentCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .getPlaylistGeneratorItemsResponseMediaContainerMetadataSkipParentCase2(let value): try container.encode(value)
        }
    }
}
