// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Refresh all known media providers. This is useful in case a provider has updated features.
    public struct RefreshProviders: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "refreshProviders"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/media/providers/refresh" }
    }
}
