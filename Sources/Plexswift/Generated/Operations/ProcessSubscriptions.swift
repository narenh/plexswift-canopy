// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Process all subscriptions asynchronously
    public struct ProcessSubscriptions: PlexOperation {
        public typealias Success = EmptyResponse

        public static let operationID = "processSubscriptions"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/media/subscriptions/process" }
    }
}
