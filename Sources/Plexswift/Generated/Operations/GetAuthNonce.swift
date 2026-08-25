// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a nonce to sign in client JWT authentication flow.
    public struct GetAuthNonce: PlexOperation {
        public typealias Success = AuthNonceResponse

        public static let operationID = "getAuthNonce"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.clientsPlexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/auth/nonce" }
    }
}
