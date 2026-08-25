// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Reset a play queue to the first item being the current item
    public struct ResetPlayQueue: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "resetPlayQueue"
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

        public var path: String { "/playQueues/\(PathComponent(playQueueId))/reset" }
    }
}
