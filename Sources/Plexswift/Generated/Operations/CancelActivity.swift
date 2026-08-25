// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Cancel a running activity. Admins can cancel all activities but other users can only cancel
    /// their own
    public struct CancelActivity: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "cancelActivity"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The UUID of the activity to cancel.
        public var activityId: String

        public init(
            activityId: String
        ) {
            self.activityId = activityId
        }

        public var path: String { "/activities/\(PathComponent(activityId))" }
    }
}
