// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get all scheduled recordings across all subscriptions
    public struct GetScheduledRecordings: PlexOperation {
        public typealias Success = MediaContainerWithMediaGrabOperation

        public static let operationID = "getScheduledRecordings"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/media/subscriptions/scheduled" }
    }
}
