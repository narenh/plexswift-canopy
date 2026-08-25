// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Available: 0.2.0
    ///
    /// Get items from a download queue
    public struct ListDownloadQueueItems: PlexOperation {
        public typealias Success = ListDownloadQueueItemsResponse

        public static let operationID = "listDownloadQueueItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The queue id
        public var queueId: Int

        public init(
            queueId: Int
        ) {
            self.queueId = queueId
        }

        public var path: String { "/downloadQueue/\(PathComponent(queueId))/items" }
    }
}
