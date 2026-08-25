// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Change or reset the logged-in user's password.
    public struct ChangePassword: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "changePassword"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/users/password" }
    }
}
