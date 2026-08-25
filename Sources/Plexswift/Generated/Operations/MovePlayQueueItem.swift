// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Moves an item in a play queue, and increases the version of the play queue. Returns the modified
    /// play queue.
    public struct MovePlayQueueItem: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "movePlayQueueItem"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the play queue.
        public var playQueueId: Int

        /// The play queue item ID to delete.
        public var playQueueItemId: Int

        /// The play queue item ID to insert the new item after. If not present, moves to the beginning.
        public var after: Int?

        public init(
            playQueueId: Int,
            playQueueItemId: Int,
            after: Int? = nil
        ) {
            self.playQueueId = playQueueId
            self.playQueueItemId = playQueueItemId
            self.after = after
        }

        public var path: String { "/playQueues/\(PathComponent(playQueueId))/items/\(PathComponent(playQueueItemId))/move" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = after {
                items.append(URLQueryItem(name: "after", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
