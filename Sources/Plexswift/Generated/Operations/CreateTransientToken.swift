// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint provides the caller with a temporary token with the same access level as the
    /// caller's token. These tokens are valid for up to 48 hours and are destroyed if the server
    /// instance is restarted.
    /// Note: This endpoint responds to all HTTP verbs but POST in preferred
    public struct CreateTransientToken: PlexOperation {
        public typealias Success = CreateTransientTokenResponse

        public static let operationID = "createTransientToken"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The value `delegation` is the only supported `type` parameter.
        public var type: CreateTransientTokenType

        /// The value `all` is the only supported `scope` parameter.
        public var scope: CreateTransientTokenScope

        public init(
            type: CreateTransientTokenType,
            scope: CreateTransientTokenScope
        ) {
            self.type = type
            self.scope = scope
        }

        public var path: String { "/security/token" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = type
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            do {
                let value = scope
                items.append(URLQueryItem(name: "scope", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
