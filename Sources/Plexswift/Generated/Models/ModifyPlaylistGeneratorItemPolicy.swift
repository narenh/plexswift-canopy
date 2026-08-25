// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ModifyPlaylistGeneratorItemPolicy: Codable, Hashable, Sendable {
    public let scope: ModifyPlaylistGeneratorItemPolicyScope?

    public let unwatched: BoolInt?

    public let value: Int?

    public init(
        scope: ModifyPlaylistGeneratorItemPolicyScope? = nil,
        unwatched: BoolInt? = nil,
        value: Int? = nil
    ) {
        self.scope = scope
        self.unwatched = unwatched
        self.value = value
    }
}
