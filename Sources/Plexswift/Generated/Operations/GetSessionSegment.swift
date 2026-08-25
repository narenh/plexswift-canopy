// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a single LiveTV session segment
    public struct GetSessionSegment: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getSessionSegment"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The session id
        public var sessionId: String

        /// The consumer id
        public var consumerId: String

        /// The segment id
        public var segmentId: String

        public init(
            sessionId: String,
            consumerId: String,
            segmentId: String
        ) {
            self.sessionId = sessionId
            self.consumerId = consumerId
            self.segmentId = segmentId
        }

        public var path: String { "/livetv/sessions/\(PathComponent(sessionId))/\(PathComponent(consumerId))/\(PathComponent(segmentId))" }
    }
}
