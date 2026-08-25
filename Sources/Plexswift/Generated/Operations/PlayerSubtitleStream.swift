// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Change the active subtitle stream.
    public struct PlayerSubtitleStream: PlexOperation {
        public typealias Success = Data

        public static let operationID = "playerSubtitleStream"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The unique identifier of the stream
        public var streamID: Int?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            streamID: Int? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.streamID = streamID
        }

        public var path: String { "/player/playback/subtitleStream" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = streamID {
                items.append(URLQueryItem(name: "streamID", value: QueryValue(value).encoded))
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
