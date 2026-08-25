// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get Plex Cloud server status for the logged-in user.
    public struct GetCloudServer: PlexOperation {
        public typealias Success = CloudServerResponse

        public static let operationID = "getCloudServer"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/cloud_server" }
    }
}
