// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Create a new Plex Home user.
    public struct CreateHomeUser: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "createHomeUser"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTVv1
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/home/users" }
    }
}
