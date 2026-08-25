// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the public IP address detected by Plex.
    public struct GetIP: PlexOperation {
        public typealias Success = IPResponse

        public static let operationID = "getIP"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/ip" }
    }
}
