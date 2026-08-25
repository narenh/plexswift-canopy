// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set shuffle, repeat, and volume parameters.
    public struct PlayerSetParameters: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerSetParameters"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// Whether to enable shuffle mode
        public var shuffle: PlayerSetParametersShuffle?

        /// The repeat mode to set
        public var `repeat`: PlayerSetParametersRepeat?

        /// The volume level to set
        public var volume: Int?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            shuffle: PlayerSetParametersShuffle? = nil,
            `repeat`: PlayerSetParametersRepeat? = nil,
            volume: Int? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.shuffle = shuffle
            self.`repeat` = `repeat`
            self.volume = volume
        }

        public var path: String { "/player/playback/setParameters" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = shuffle {
                items.append(URLQueryItem(name: "shuffle", value: QueryValue(value).encoded))
            }
            if let value = `repeat` {
                items.append(URLQueryItem(name: "repeat", value: QueryValue(value).encoded))
            }
            if let value = volume {
                items.append(URLQueryItem(name: "volume", value: QueryValue(value).encoded))
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
