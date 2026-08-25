// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetFriendsResponseUsersItem: Codable, Hashable, Sendable {
    public let title: String?

    public let email: String?

    public let id: Int?

    public let thumb: String?

    public let username: String?

    public let uuid: String?

    public init(
        title: String? = nil,
        email: String? = nil,
        id: Int? = nil,
        thumb: String? = nil,
        username: String? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.email = email
        self.id = id
        self.thumb = thumb
        self.username = username
        self.uuid = uuid
    }
}
