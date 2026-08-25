// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Available: 0.2.0
    ///
    /// Reprocess download queue items with previous decision parameters
    public struct RestartProcessingDownloadQueueItems: PlexOperation {
        public typealias Success = Data

        public static let operationID = "restartProcessingDownloadQueueItems"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The queue id
        public var queueId: Int

        /// The item ids
        public var itemId: [Int]

        public init(
            queueId: Int,
            itemId: [Int]
        ) {
            self.queueId = queueId
            self.itemId = itemId
        }

        public var path: String { "/downloadQueue/\(PathComponent(queueId))/items/\(itemId.map { PathComponent($0).description }.joined(separator: ","))/restart" }
    }
}
