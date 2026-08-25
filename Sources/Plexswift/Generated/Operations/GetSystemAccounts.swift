// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a list of local system accounts.
    public struct GetSystemAccounts: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "getSystemAccounts"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/accounts" }
    }
}
