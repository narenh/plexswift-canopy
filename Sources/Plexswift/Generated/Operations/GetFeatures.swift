// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get Plex Pass feature flags for the logged-in user.
    public struct GetFeatures: PlexOperation {
        public typealias Success = GetFeaturesResponse

        public static let operationID = "getFeatures"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/features" }
    }
}
