// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get Plex public JWKs for signature verification.
    public struct GetAuthKeys: PlexOperation {
        public typealias Success = AuthKeysResponse

        public static let operationID = "getAuthKeys"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.clientsPlexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/auth/keys" }
    }
}
