// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Terminate a playback session kicking off the user
    public struct TerminateSession: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "terminateSession"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The session id (found in the `Session` element in
        /// [/status/sessions](#tag/Status/operation/statusGetSlash))
        public var sessionId: String

        /// The reason to give to the user (typically displayed in the client)
        public var reason: String?

        public init(
            sessionId: String,
            reason: String? = nil
        ) {
            self.sessionId = sessionId
            self.reason = reason
        }

        public var path: String { "/status/sessions/terminate" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = sessionId
                items.append(URLQueryItem(name: "sessionId", value: QueryValue(value).encoded))
            }
            if let value = reason {
                items.append(URLQueryItem(name: "reason", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
