// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Voice activity detection availability flag returned by PMS.
/// PMS may return this as a boolean or as string values (`"0"` or `"1"`).
public enum MediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivity: Codable, Hashable, Sendable {
    case bool(Bool)
    case mediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivityCase2(MediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivityCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(MediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivityCase2.self) {
            self = .mediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivityCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            MediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivity.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, MediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivityCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .mediaContainerWithDecisionMediaContainerMetadataItemMediaItemHasVoiceActivityCase2(let value): try container.encode(value)
        }
    }
}
