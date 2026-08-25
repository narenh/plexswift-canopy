// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct NotificationContainer: Codable, Hashable, Sendable {
    /// The notification type
    public let type: String?

    public let playSessionStateNotification: [PlaySessionStateNotification]?

    public let reachabilityNotification: [ReachabilityNotification]?

    /// Number of notifications
    public let size: Int?

    public let statusNotification: [StatusNotification]?

    public let timelineEntry: [TimelineEntry]?

    public init(
        type: String? = nil,
        playSessionStateNotification: [PlaySessionStateNotification]? = nil,
        reachabilityNotification: [ReachabilityNotification]? = nil,
        size: Int? = nil,
        statusNotification: [StatusNotification]? = nil,
        timelineEntry: [TimelineEntry]? = nil
    ) {
        self.type = type
        self.playSessionStateNotification = playSessionStateNotification
        self.reachabilityNotification = reachabilityNotification
        self.size = size
        self.statusNotification = statusNotification
        self.timelineEntry = timelineEntry
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case playSessionStateNotification = "PlaySessionStateNotification"
        case reachabilityNotification = "ReachabilityNotification"
        case size
        case statusNotification = "StatusNotification"
        case timelineEntry = "TimelineEntry"
    }
}
