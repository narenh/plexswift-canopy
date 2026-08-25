// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint will attempt to start a specific Butler task by name.
    public struct StartTask: PlexOperation {
        public typealias Success = String

        public static let operationID = "startTask"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The task name
        public var butlerTask: StartTaskButlerTask

        public init(
            butlerTask: StartTaskButlerTask
        ) {
            self.butlerTask = butlerTask
        }

        public var path: String { "/butler/\(PathComponent(butlerTask))" }
    }
}
