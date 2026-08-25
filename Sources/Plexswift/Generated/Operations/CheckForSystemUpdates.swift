// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Check for available PMS updates.
    public struct CheckForSystemUpdates: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "checkForSystemUpdates"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/system/updates" }
    }
}
