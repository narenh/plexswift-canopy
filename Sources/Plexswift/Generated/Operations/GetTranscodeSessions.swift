// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get active transcode sessions.
    public struct GetTranscodeSessions: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getTranscodeSessions"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/transcode/sessions" }
    }
}
