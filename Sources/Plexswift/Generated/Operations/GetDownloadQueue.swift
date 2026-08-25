// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Available: 0.2.0
    ///
    /// Get a download queue by its id
    public struct GetDownloadQueue: PlexOperation {
        public typealias Success = GetDownloadQueueResponse

        public static let operationID = "getDownloadQueue"
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

        public var path: String { "/downloadQueue/\(PathComponent(queueId))" }
    }
}
