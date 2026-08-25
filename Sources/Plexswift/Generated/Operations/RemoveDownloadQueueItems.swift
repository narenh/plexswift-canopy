// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// delete items from a download queue
    public struct RemoveDownloadQueueItems: PlexOperation {
        public typealias Success = Data

        public static let operationID = "removeDownloadQueueItems"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The queue id
        public var queueId: Int

        /// The item id
        public var itemId: [Int]

        public init(
            queueId: Int,
            itemId: [Int]
        ) {
            self.queueId = queueId
            self.itemId = itemId
        }

        public var path: String { "/downloadQueue/\(PathComponent(queueId))/items/\(itemId.map { PathComponent($0).description }.joined(separator: ","))" }
    }
}
