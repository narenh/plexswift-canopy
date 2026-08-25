// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ModifyPlaylistGeneratorItemLocation: Codable, Hashable, Sendable {
    public let uri: String?

    public init(
        uri: String? = nil
    ) {
        self.uri = uri
    }
}
