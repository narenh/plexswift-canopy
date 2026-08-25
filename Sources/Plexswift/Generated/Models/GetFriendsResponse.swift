// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetFriendsResponse: Codable, Hashable, Sendable {
    public let users: [GetFriendsResponseUsersItem]?

    public init(
        users: [GetFriendsResponseUsersItem]? = nil
    ) {
        self.users = users
    }
}
