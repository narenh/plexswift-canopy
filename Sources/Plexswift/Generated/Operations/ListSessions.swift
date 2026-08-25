// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List all current playbacks on this server
    public struct ListSessions: PlexOperation {
        public typealias Success = ListSessionsResponse

        public static let operationID = "listSessions"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/status/sessions" }
    }
}
