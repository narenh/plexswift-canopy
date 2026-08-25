// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of Plex Home users.
    public struct GetHomeUsers: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "getHomeUsers"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv1
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/home/users" }
    }
}
