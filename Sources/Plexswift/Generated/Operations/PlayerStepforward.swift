// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Step forward one frame
    public struct PlayerStepforward: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "playerStepforward"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The client identifier of the target device to control. If omitted, the command is sent to the
        /// default/active client.
        public var xPlexTargetClientIdentifier: String?

        public init(
            xPlexTargetClientIdentifier: String? = nil
        ) {
            self.xPlexTargetClientIdentifier = xPlexTargetClientIdentifier
        }

        public var path: String { "/player/playback/stepForward" }

        public var headers: [String: String] {
            var headers: [String: String] = [:]
            if let value = xPlexTargetClientIdentifier {
                headers["X-Plex-Target-Client-Identifier"] = QueryValue(value).encoded
            }
            return headers
        }
    }
}
