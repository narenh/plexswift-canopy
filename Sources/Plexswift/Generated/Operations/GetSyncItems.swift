// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get sync items list.
    public struct GetSyncItems: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "getSyncItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/sync/items" }
    }
}
