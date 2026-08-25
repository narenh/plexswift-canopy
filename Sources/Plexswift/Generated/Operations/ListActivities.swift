// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List all activities on the server. Admins can see all activities but other users can only see
    /// their own
    public struct ListActivities: PlexOperation {
        public typealias Success = ListActivitiesResponse

        public static let operationID = "listActivities"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/activities" }
    }
}
