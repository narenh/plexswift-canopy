// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a playlist index for playing this session
    public struct GetSessionPlaylistIndex: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getSessionPlaylistIndex"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The session id
        public var sessionId: String

        /// The consumer id
        public var consumerId: String

        public init(
            sessionId: String,
            consumerId: String
        ) {
            self.sessionId = sessionId
            self.consumerId = consumerId
        }

        public var path: String { "/livetv/sessions/\(PathComponent(sessionId))/\(PathComponent(consumerId))/index.m3u8" }
    }
}
