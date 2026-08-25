// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Terminate a Live TV session.
    public struct DeleteLiveTVSession: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteLiveTVSession"
        public static let method = HTTPMethod.delete
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
