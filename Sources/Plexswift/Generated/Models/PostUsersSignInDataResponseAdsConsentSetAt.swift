// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum PostUsersSignInDataResponseAdsConsentSetAt: Codable, Hashable, Sendable {
    case plexDateTime(PlexDateTime)
    case anyJSON(AnyJSON)

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(PlexDateTime.self) {
            self = .plexDateTime(value)
            return
        }
        if let value = try? container.decode(AnyJSON.self) {
            self = .anyJSON(value)
            return
        }
        throw DecodingError.typeMismatch(
            PostUsersSignInDataResponseAdsConsentSetAt.self,
            DecodingError.Context(
                codingPath: container.codingPath,
                debugDescription: "Expected one of: PlexDateTime, AnyJSON"
            )
        )
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .plexDateTime(let value): try container.encode(value)
        case .anyJSON(let value): try container.encode(value)
        }
    }
}
