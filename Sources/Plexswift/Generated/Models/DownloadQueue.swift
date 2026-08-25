// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct DownloadQueue: Codable, Hashable, Sendable {
    public let id: Int?

    public let itemCount: Int?

    /// The state of this queue
    /// - deciding: At least one item is still being decided
    /// - waiting: At least one item is waiting for transcode and none are currently transcoding
    /// - processing: At least one item is being transcoded
    /// - done: All items are available (or potentially expired)
    /// - error: At least one item has encountered an error
    public let status: DownloadQueueStatus?

    public init(
        id: Int? = nil,
        itemCount: Int? = nil,
        status: DownloadQueueStatus? = nil
    ) {
        self.id = id
        self.itemCount = itemCount
        self.status = status
    }
}
