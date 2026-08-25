// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Stop all refreshes across all sections
    public struct StopAllRefreshes: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "stopAllRefreshes"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/library/sections/all/refresh" }
    }
}
