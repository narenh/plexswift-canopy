// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Indicates if the stream can auto-sync.
public enum MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSync: Codable, Hashable, Sendable {
    case bool(Bool)
    case mediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSyncCase2(MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSyncCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSyncCase2.self) {
            self = .mediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSyncCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSync.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSyncCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .mediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemCanAutoSyncCase2(let value): try container.encode(value)
        }
    }
}
