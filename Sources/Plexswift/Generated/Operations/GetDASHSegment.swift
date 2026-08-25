// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// DASH segment delivery for adaptive streaming.
    public struct GetDASHSegment: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getDASHSegment"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The type of transcoding (e.g., video, audio)
        public var transcodeType: String

        /// The unique identifier of the session
        public var sessionId: String

        /// The unique identifier of the media segment
        public var segmentId: String

        public init(
            transcodeType: String,
            sessionId: String,
            segmentId: String
        ) {
            self.transcodeType = transcodeType
            self.sessionId = sessionId
            self.segmentId = segmentId
        }

        public var path: String { "/\(PathComponent(transcodeType))/:/transcode/universal/session/\(PathComponent(sessionId))/\(PathComponent(segmentId)).m4s" }
    }
}
