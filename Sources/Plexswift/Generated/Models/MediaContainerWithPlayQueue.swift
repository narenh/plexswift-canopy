// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A media container representing a play queue.
public struct MediaContainerWithPlayQueue: Codable, Hashable, Sendable {
    public let identifier: String?

    /// The offset of where this container page starts among the total objects available. Also provided
    /// in the `X-Plex-Container-Start` header.
    public let offset: Int?

    public let size: Int?

    /// The total size of objects available. Also provided in the `X-Plex-Container-Total-Size` header.
    public let totalSize: Int?

    public let playQueueID: Int?

    public let playQueueLastAddedItemID: Int?

    public let playQueueSelectedItemID: Int?

    public let playQueueSelectedItemOffset: Int?

    public let playQueueSelectedMetadataItemID: Int?

    public let playQueueShuffled: Bool?

    public let playQueueSourceURI: String?

    public let playQueueTotalCount: Int?

    public let playQueueVersion: Int?

    public init(
        identifier: String? = nil,
        offset: Int? = nil,
        size: Int? = nil,
        totalSize: Int? = nil,
        playQueueID: Int? = nil,
        playQueueLastAddedItemID: Int? = nil,
        playQueueSelectedItemID: Int? = nil,
        playQueueSelectedItemOffset: Int? = nil,
        playQueueSelectedMetadataItemID: Int? = nil,
        playQueueShuffled: Bool? = nil,
        playQueueSourceURI: String? = nil,
        playQueueTotalCount: Int? = nil,
        playQueueVersion: Int? = nil
    ) {
        self.identifier = identifier
        self.offset = offset
        self.size = size
        self.totalSize = totalSize
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
