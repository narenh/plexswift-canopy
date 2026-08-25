// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Manually trigger a transcoder fallback ex: HEVC to h.264 or hw to sw
    public struct TriggerFallback: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "triggerFallback"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Type of transcode media
        public var transcodeType: TriggerFallbackTranscodeType

        /// Transcode session UUID
        public var transcodeSessionId: String?

        public init(
            transcodeType: TriggerFallbackTranscodeType,
            transcodeSessionId: String? = nil
        ) {
            self.transcodeType = transcodeType
            self.transcodeSessionId = transcodeSessionId
        }

        public var path: String { "/\(PathComponent(transcodeType))/:/transcode/universal/fallback" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = transcodeSessionId {
                items.append(URLQueryItem(name: "transcodeSessionId", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
