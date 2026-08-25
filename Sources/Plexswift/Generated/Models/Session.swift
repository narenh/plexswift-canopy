// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Information about the playback session
public struct Session: Codable, Hashable, Sendable {
    /// Title of the media being played.
    public let title: String?

    /// The bandwidth used by this client's playback in kbps
    public let bandwidth: Int?

    /// The id of the playback session
    public let id: String?

    /// The location of the client
    public let location: SessionLocation?

    /// Unique session key for this playback session.
    public let sessionKey: String?

    /// ID of the user owning this session.
    public let userID: Int?

    /// UUID of the playback session.
    public let uuid: String?

    public init(
        title: String? = nil,
        bandwidth: Int? = nil,
        id: String? = nil,
        location: SessionLocation? = nil,
        sessionKey: String? = nil,
        userID: Int? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.bandwidth = bandwidth
        self.id = id
        self.location = location
        self.sessionKey = sessionKey
        self.userID = userID
        self.uuid = uuid
    }
}
