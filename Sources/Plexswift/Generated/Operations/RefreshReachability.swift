// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Refresh remote access port mapping.
    public struct RefreshReachability: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "refreshReachability"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/myplex/refreshReachability" }
    }
}
