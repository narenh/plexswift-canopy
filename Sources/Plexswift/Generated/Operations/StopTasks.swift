// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint will stop all currently running tasks and remove any scheduled tasks from the
    /// queue.
    public struct StopTasks: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "stopTasks"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/butler" }
    }
}
