// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum AllowSync: Codable, Hashable, Sendable {
    case bool(Bool)
    case allowSyncCase2(AllowSyncCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(AllowSyncCase2.self) {
            self = .allowSyncCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            AllowSync.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, AllowSyncCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .allowSyncCase2(let value): try container.encode(value)
        }
    }
}
