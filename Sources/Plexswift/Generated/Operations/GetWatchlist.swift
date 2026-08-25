// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the user's Plex Discover watchlist.
    public struct GetWatchlist: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getWatchlist"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/library/sections/watchlist/all" }
    }
}
