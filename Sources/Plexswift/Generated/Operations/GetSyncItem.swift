// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get sync item details.
    public struct GetSyncItem: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "getSyncItem"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the sync item
        public var syncId: Int

        public init(
            syncId: Int
        ) {
            self.syncId = syncId
        }

        public var path: String { "/sync/items/\(PathComponent(syncId))" }
    }
}
