// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the client volume.
    public struct PlayerVolume: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerVolume"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The level
        public var level: Int?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            level: Int? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.level = level
        }

        public var path: String { "/player/playback/volume" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = level {
                items.append(URLQueryItem(name: "level", value: QueryValue(value).encoded))
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
