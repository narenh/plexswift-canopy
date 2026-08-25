// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PlayQueueResponse: Codable, Hashable, Sendable {
    /// The ID of the play queue, which is used in subsequent requests.
    public let playQueueID: Int?

    /// Defines where the "Up Next" region starts
    public let playQueueLastAddedItemID: String?

    /// The queue item ID of the currently selected item.
    public let playQueueSelectedItemID: Int?

    /// The offset of the selected item in the play queue, from the beginning of the queue.
    public let playQueueSelectedItemOffset: Int?

    /// The metadata item ID of the currently selected item (matches `ratingKey` attribute in metadata
    /// item if the media provider is a library).
    public let playQueueSelectedMetadataItemID: Int?

    /// Whether or not the queue is shuffled.
    public let playQueueShuffled: Bool?

    /// The original URI used to create the play queue.
    public let playQueueSourceURI: String?

    /// The total number of items in the play queue.
    public let playQueueTotalCount: Int?

    /// The version of the play queue. It increments every time a change is made to the play queue to
    /// assist clients in knowing when to refresh.
    public let playQueueVersion: Int?

    public init(
        playQueueID: Int? = nil,
        playQueueLastAddedItemID: String? = nil,
        playQueueSelectedItemID: Int? = nil,
        playQueueSelectedItemOffset: Int? = nil,
        playQueueSelectedMetadataItemID: Int? = nil,
        playQueueShuffled: Bool? = nil,
        playQueueSourceURI: String? = nil,
        playQueueTotalCount: Int? = nil,
        playQueueVersion: Int? = nil
    ) {
        self.playQueueID = playQueueID
        self.playQueueLastAddedItemID = playQueueLastAddedItemID
        self.playQueueSelectedItemID = playQueueSelectedItemID
        self.playQueueSelectedItemOffset = playQueueSelectedItemOffset
        self.playQueueSelectedMetadataItemID = playQueueSelectedMetadataItemID
        self.playQueueShuffled = playQueueShuffled
        self.playQueueSourceURI = playQueueSourceURI
        self.playQueueTotalCount = playQueueTotalCount
        self.playQueueVersion = playQueueVersion
    }
}
