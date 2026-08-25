// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint will attempt to start all Butler tasks that are enabled in the settings. Butler
    /// tasks normally run automatically during a time window configured on the server's Settings page
    /// but can be manually started using this endpoint. Tasks will run with the following criteria:
    ///
    /// 1. Any tasks not scheduled to run on the current day will be skipped.
    /// 2. If a task is configured to run at a random time during the configured window and we are outside that window, the task will start immediately.
    /// 3. If a task is configured to run at a random time during the configured window and we are within that window, the task will be scheduled at a random time within the window.
    /// 4. If we are outside the configured window, the task will start immediately.
    public struct StartTasks: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "startTasks"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/butler" }
    }
}
