// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Play a specific media item on the client.
    public struct PlayerPlayMedia: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerPlayMedia"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The key of the media item to play
        public var key: String?

        /// The byte offset for stream seeking
        public var offset: Int?

        /// The machine identifier of the target device
        public var machineIdentifier: String?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            key: String? = nil,
            offset: Int? = nil,
            machineIdentifier: String? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.key = key
            self.offset = offset
            self.machineIdentifier = machineIdentifier
        }

        public var path: String { "/player/playback/playMedia" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = key {
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
            }
            if let value = offset {
                items.append(URLQueryItem(name: "offset", value: QueryValue(value).encoded))
            }
            if let value = machineIdentifier {
                items.append(URLQueryItem(name: "machineIdentifier", value: QueryValue(value).encoded))
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
