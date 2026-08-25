// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// When present on an episode or track item, indicates parent should be skipped in favor of
/// grandparent (show).
public enum ItemsSkipParent: Codable, Hashable, Sendable {
    case bool(Bool)
    case itemsSkipParentCase2(ItemsSkipParentCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(ItemsSkipParentCase2.self) {
            self = .itemsSkipParentCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            ItemsSkipParent.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, ItemsSkipParentCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .itemsSkipParentCase2(let value): try container.encode(value)
        }
    }
}
