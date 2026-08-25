// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the recently added hub for the home screen.
    public struct GetHomeRecentlyAdded: PlexOperation {
        public typealias Success = MediaContainerWithHubs

        public static let operationID = "getHomeRecentlyAdded"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/hubs/home/recentlyAdded" }
    }
}
