// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set active audio, subtitle, and video streams.
    public struct PlayerSetStreams: PlexOperation {
        public typealias Success = Data

        public static let operationID = "playerSetStreams"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The unique identifier of the audiostream
        public var audioStreamID: Int?

        /// The unique identifier of the subtitlestream
        public var subtitleStreamID: Int?

        /// The unique identifier of the videostream
        public var videoStreamID: Int?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            audioStreamID: Int? = nil,
            subtitleStreamID: Int? = nil,
            videoStreamID: Int? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.audioStreamID = audioStreamID
            self.subtitleStreamID = subtitleStreamID
            self.videoStreamID = videoStreamID
        }

        public var path: String { "/player/playback/setStreams" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = audioStreamID {
                items.append(URLQueryItem(name: "audioStreamID", value: QueryValue(value).encoded))
            }
            if let value = subtitleStreamID {
                items.append(URLQueryItem(name: "subtitleStreamID", value: QueryValue(value).encoded))
            }
            if let value = videoStreamID {
                items.append(URLQueryItem(name: "videoStreamID", value: QueryValue(value).encoded))
            }
            return items
        }

        public var headers: [String: String] {
            var headers: [String: String] = [:]
            if let value = xPlexTargetClientIdentifier {
                headers["X-Plex-Target-Client-Identifier"] = QueryValue(value).encoded
            }
            return headers
        }
    }
}
