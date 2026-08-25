// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Force PMS to refresh content for known SyncLists.
    public struct RefreshSyncContent: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "refreshSyncContent"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/sync/refreshContent" }
    }
}
