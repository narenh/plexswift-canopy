// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ListProvidersResponseMediaContainer: Codable, Hashable, Sendable {
    public let provider: [Provider]?

    public init(
        provider: [Provider]? = nil
    ) {
        self.provider = provider
    }

    private enum CodingKeys: String, CodingKey {
        case provider = "Provider"
    }
}
