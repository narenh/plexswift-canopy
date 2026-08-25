// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Deletes an item in a play queue. Increments the version of the play queue. Returns the modified
    /// play queue.
    public struct DeletePlayQueueItem: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deletePlayQueueItem"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the play queue.
        public var playQueueId: Int

        /// The play queue item ID to delete.
        public var playQueueItemId: Int

        public init(
            playQueueId: Int,
            playQueueItemId: Int
        ) {
            self.playQueueId = playQueueId
            self.playQueueItemId = playQueueItemId
        }

        public var path: String { "/playQueues/\(PathComponent(playQueueId))/items/\(PathComponent(playQueueItemId))" }
    }
}
