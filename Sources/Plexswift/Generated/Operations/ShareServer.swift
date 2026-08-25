// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Share a server with a friend or managed user.
    public struct ShareServer: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "shareServer"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/shared_servers" }
    }
}
