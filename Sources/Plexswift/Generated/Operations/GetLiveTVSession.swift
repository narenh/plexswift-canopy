// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a single livetv session and metadata
    public struct GetLiveTVSession: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getLiveTVSession"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The session id
        public var sessionId: String

        public init(
            sessionId: String
        ) {
            self.sessionId = sessionId
        }

        public var path: String { "/livetv/sessions/\(PathComponent(sessionId))" }
    }
}
