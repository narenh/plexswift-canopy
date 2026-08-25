// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get list of all users that are friends and have library access with the provided Plex
    /// authentication token
    public struct GetUsers: PlexOperation {
        public typealias Success = GetUsersResponse

        public static let operationID = "getUsers"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv1
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/users" }
    }
}
