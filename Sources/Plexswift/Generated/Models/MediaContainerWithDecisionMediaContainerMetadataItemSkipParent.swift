// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// When present on an episode or track item, indicates parent should be skipped in favor of
/// grandparent (show).
public enum MediaContainerWithDecisionMediaContainerMetadataItemSkipParent: Codable, Hashable, Sendable {
    case bool(Bool)
    case mediaContainerWithDecisionMediaContainerMetadataItemSkipParentCase2(MediaContainerWithDecisionMediaContainerMetadataItemSkipParentCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(MediaContainerWithDecisionMediaContainerMetadataItemSkipParentCase2.self) {
            self = .mediaContainerWithDecisionMediaContainerMetadataItemSkipParentCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            MediaContainerWithDecisionMediaContainerMetadataItemSkipParent.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, MediaContainerWithDecisionMediaContainerMetadataItemSkipParentCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .mediaContainerWithDecisionMediaContainerMetadataItemSkipParentCase2(let value): try container.encode(value)
        }
    }
}
