// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint will stop a currently running task by name, or remove it from the list of
    /// scheduled tasks if it exists
    public struct StopTask: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "stopTask"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The task name
        public var butlerTask: StopTaskButlerTask

        public init(
            butlerTask: StopTaskButlerTask
        ) {
            self.butlerTask = butlerTask
        }

        public var path: String { "/butler/\(PathComponent(butlerTask))" }
    }
}
