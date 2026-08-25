// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List access tokens for the server.
    public struct GetServerAccessTokens: PlexOperation {
        public typealias Success = ServerAccessTokensResponse

        public static let operationID = "getServerAccessTokens"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/server/access_tokens" }
    }
}
