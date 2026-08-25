// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get features enabled per shared user for the server.
    public struct GetServerUserFeatures: PlexOperation {
        public typealias Success = ServerUserFeaturesResponse

        public static let operationID = "getServerUserFeatures"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/server/users/features" }
    }
}
