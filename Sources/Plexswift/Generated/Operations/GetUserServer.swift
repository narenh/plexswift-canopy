// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get server association information for the logged-in user.
    public struct GetUserServer: PlexOperation {
        public typealias Success = ConnectionInfo

        public static let operationID = "getUserServer"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/server" }
    }
}
