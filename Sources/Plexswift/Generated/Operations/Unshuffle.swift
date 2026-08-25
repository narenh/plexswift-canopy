// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Unshuffles a play queue and restores "natural order". Note that this is currently only supported
    /// for play queues *without* an Up Next area. Returns the modified play queue.
    public struct Unshuffle: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "unshuffle"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the play queue.
        public var playQueueId: Int

        public init(
            playQueueId: Int
        ) {
            self.playQueueId = playQueueId
        }

        public var path: String { "/playQueues/\(PathComponent(playQueueId))/unshuffle" }
    }
}
