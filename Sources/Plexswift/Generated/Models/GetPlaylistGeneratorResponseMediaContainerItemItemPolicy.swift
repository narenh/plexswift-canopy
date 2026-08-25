// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetPlaylistGeneratorResponseMediaContainerItemItemPolicy: Codable, Hashable, Sendable {
    public let scope: GetPlaylistGeneratorResponseMediaContainerItemItemPolicyScope?

    /// True if only unwatched items are optimized
    public let unwatched: Bool?

    /// If the scope is count, the number of items to optimize
    public let value: Int?

    public init(
        scope: GetPlaylistGeneratorResponseMediaContainerItemItemPolicyScope? = nil,
        unwatched: Bool? = nil,
        value: Int? = nil
    ) {
        self.scope = scope
        self.unwatched = unwatched
        self.value = value
    }
}
