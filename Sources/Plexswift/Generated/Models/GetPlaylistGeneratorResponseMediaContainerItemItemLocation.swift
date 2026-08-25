// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetPlaylistGeneratorResponseMediaContainerItemItemLocation: Codable, Hashable, Sendable {
    public let librarySectionID: Int?

    public let uri: String?

    public init(
        librarySectionID: Int? = nil,
        uri: String? = nil
    ) {
        self.librarySectionID = librarySectionID
        self.uri = uri
    }
}
