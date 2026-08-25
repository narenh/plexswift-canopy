// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the User data from the provided X-Plex-Token
    public struct GetTokenDetails: PlexOperation {
        public typealias Success = UserPlexAccount

        public static let operationID = "getTokenDetails"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/user" }
    }
}
