// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Remove an item from the user's Plex Discover watchlist.
    public struct RemoveFromWatchlist: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "removeFromWatchlist"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The URI of the item to add or remove
        public var uri: String

        public init(
            uri: String
        ) {
            self.uri = uri
        }

        public var path: String { "/actions/removeFromWatchlist" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = uri
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
