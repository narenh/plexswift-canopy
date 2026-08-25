// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get details about this PMS's identity
    public struct GetIdentity: PlexOperation {
        public typealias Success = GetIdentityResponse

        public static let operationID = "getIdentity"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = false
        public static let requiresClientIdentifier = false

        public var path: String { "/identity" }
    }
}
