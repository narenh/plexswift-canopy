// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get legacy friends list (XML).
    public struct GetLegacyUsers: PlexOperation {
        public typealias Success = String

        public static let operationID = "getLegacyUsers"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv1
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/api/users/" }
    }
}
