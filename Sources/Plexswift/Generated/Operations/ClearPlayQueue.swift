// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Deletes all items in the play queue, and increases the version of the play queue.
    public struct ClearPlayQueue: PlexOperation {
        public typealias Success = MediaContainerWithPlaylistMetadata

        public static let operationID = "clearPlayQueue"
        public static let method = HTTPMethod.delete
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

        public var path: String { "/playQueues/\(PathComponent(playQueueId))/items" }
    }
}
