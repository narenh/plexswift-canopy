// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetUsersResponse: Codable, Hashable, Sendable {
    /// Container holding user and server details.
    public let mediaContainer: GetUsersResponseMediaContainer?

    public init(
        mediaContainer: GetUsersResponseMediaContainer? = nil
    ) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }
}
