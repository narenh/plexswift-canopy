// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Skip to a specific item in the play queue.
    public struct PlayerSkipTo: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerSkipTo"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The key of the item to skip to
        public var key: String?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            key: String? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.key = key
        }

        public var path: String { "/player/playback/skipTo" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = key {
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
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
