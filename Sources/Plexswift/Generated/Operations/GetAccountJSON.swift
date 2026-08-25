// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the logged-in user's account details in JSON format (legacy v1 endpoint).
    public struct GetAccountJSON: PlexOperation {
        public typealias Success = UserPlexAccount

        public static let operationID = "getAccountJSON"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/users/account.json" }
    }
}
