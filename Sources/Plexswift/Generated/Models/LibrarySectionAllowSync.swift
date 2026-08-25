// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum LibrarySectionAllowSync: Codable, Hashable, Sendable {
    case bool(Bool)
    case librarySectionAllowSyncCase2(LibrarySectionAllowSyncCase2)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(LibrarySectionAllowSyncCase2.self) {
            self = .librarySectionAllowSyncCase2(value)
            return
        }
        throw DecodingError.typeMismatch(
            LibrarySectionAllowSync.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: Bool, LibrarySectionAllowSyncCase2"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let value): try container.encode(value)
        case .librarySectionAllowSyncCase2(let value): try container.encode(value)
        }
    }
}
