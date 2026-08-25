// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the playback state directly.
    public struct PlayerSetState: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerSetState"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        /// The desired playback state
        public var state: PlayerSetStateState?

        public init(
            xPlexTargetClientIdentifier: String? = nil,
            state: PlayerSetStateState? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
            self.state = state
        }

        public var path: String { "/player/playback/setState" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = state {
                items.append(URLQueryItem(name: "state", value: QueryValue(value).encoded))
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
