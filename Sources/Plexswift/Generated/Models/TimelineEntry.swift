// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A timeline update entry delivered via WebSocket or EventSource
public struct TimelineEntry: Codable, Hashable, Sendable {
    public let title: String?

    public let type: Int?

    public let itemID: Int?

    public let metadataState: String?

    public let playQueueItemID: Int?

    public let state: Int?

    public init(
        title: String? = nil,
        type: Int? = nil,
        itemID: Int? = nil,
        metadataState: String? = nil,
        playQueueItemID: Int? = nil,
        state: Int? = nil
    ) {
        self.title = title
        self.type = type
        self.itemID = itemID
        self.metadataState = metadataState
        self.playQueueItemID = playQueueItemID
        self.state = state
    }
}
