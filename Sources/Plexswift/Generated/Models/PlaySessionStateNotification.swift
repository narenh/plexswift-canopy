// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Real-time playback state change notification
public struct PlaySessionStateNotification: Codable, Hashable, Sendable {
    public let controllable: String?

    public let guid: String?

    public let key: String?

    public let playQueueID: Int?

    public let playQueueItemID: Int?

    public let ratingKey: String?

    public let sessionKey: String?

    public let state: PlaySessionStateNotificationState?

    public let transcodeSession: String?

    public let url: String?

    public let viewOffset: Int?

    public init(
        controllable: String? = nil,
        guid: String? = nil,
        key: String? = nil,
        playQueueID: Int? = nil,
        playQueueItemID: Int? = nil,
        ratingKey: String? = nil,
        sessionKey: String? = nil,
        state: PlaySessionStateNotificationState? = nil,
        transcodeSession: String? = nil,
        url: String? = nil,
        viewOffset: Int? = nil
    ) {
        self.controllable = controllable
        self.guid = guid
        self.key = key
        self.playQueueID = playQueueID
        self.playQueueItemID = playQueueItemID
        self.ratingKey = ratingKey
        self.sessionKey = sessionKey
        self.state = state
        self.transcodeSession = transcodeSession
        self.url = url
        self.viewOffset = viewOffset
    }
}
