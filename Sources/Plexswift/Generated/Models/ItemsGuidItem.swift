// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ItemsGuidItem: Codable, Hashable, Sendable {
    /// The unique identifier for the Guid. Can be prefixed with imdb://, tmdb://, tvdb://
    public let id: String?

    public init(
        id: String? = nil
    ) {
        self.id = id
    }
}
