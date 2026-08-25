// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct AddedQueueItem: Codable, Hashable, Sendable {
    /// The queue item id that was added or the existing one if an item already exists in this queue
    /// with the same parameters
    public let id: Int?

    /// The key added to the queue
    public let key: String?

    public init(
        id: Int? = nil,
        key: String? = nil
    ) {
        self.id = id
        self.key = key
    }
}
