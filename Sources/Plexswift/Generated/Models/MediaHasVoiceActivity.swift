// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Voice activity detection availability flag returned by PMS.
/// PMS may return this as a boolean or as string values (`"0"` or `"1"`).
public enum MediaHasVoiceActivity: Codable, Hashable, Sendable {
    case bool(Bool)
    case mediaHasVoiceActivityCase2(MediaHasVoiceActivityCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(MediaHasVoiceActivityCase2.self) {
            self = .mediaHasVoiceActivityCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            MediaHasVoiceActivity.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, MediaHasVoiceActivityCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .mediaHasVoiceActivityCase2(let value): try container.encode(value)
        }
    }
}
