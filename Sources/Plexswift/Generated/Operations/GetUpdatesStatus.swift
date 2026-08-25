// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the status of updating the server
    public struct GetUpdatesStatus: PlexOperation {
        public typealias Success = GetUpdatesStatusResponse

        public static let operationID = "getUpdatesStatus"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/updater/status" }
    }
}
