// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Health / latency check. No authentication required.
    public struct Ping: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "ping"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = false
        public static let requiresClientIdentifier = false

        public var path: String { "/ping" }
    }
}
