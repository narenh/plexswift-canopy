// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Invalidate the current authentication token.
    public struct SignOut: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "signOut"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/users/signout" }
    }
}
