// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get linked MyPlex account info on PMS.
    public struct GetMyPlexAccount: PlexOperation {
        public typealias Success = UserPlexAccount

        public static let operationID = "getMyPlexAccount"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/myplex/account" }
    }
}
