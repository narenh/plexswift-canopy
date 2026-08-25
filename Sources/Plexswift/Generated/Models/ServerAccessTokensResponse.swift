// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ServerAccessTokensResponse: Codable, Hashable, Sendable {
    public let accessTokens: [ServerAccessTokensResponseAccessTokensItem]?

    public init(
        accessTokens: [ServerAccessTokensResponseAccessTokensItem]? = nil
    ) {
        self.accessTokens = accessTokens
    }
}
