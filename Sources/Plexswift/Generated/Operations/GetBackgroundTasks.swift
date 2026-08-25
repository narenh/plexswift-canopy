// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of all background tasks
    public struct GetBackgroundTasks: PlexOperation {
        public typealias Success = GetBackgroundTasksResponse

        public static let operationID = "getBackgroundTasks"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/status/sessions/background" }
    }
}
