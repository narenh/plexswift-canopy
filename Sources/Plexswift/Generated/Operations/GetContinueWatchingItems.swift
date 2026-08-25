// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get direct access to Continue Watching items.
    public struct GetContinueWatchingItems: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getContinueWatchingItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/hubs/continueWatching/items" }
    }
}
