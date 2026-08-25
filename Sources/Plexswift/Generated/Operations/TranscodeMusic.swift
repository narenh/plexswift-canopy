// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Audio transcode endpoint for music playback.
    public struct TranscodeMusic: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "transcodeMusic"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/music/:/transcode" }
    }
}
