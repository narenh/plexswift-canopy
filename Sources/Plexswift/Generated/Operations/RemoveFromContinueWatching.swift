// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Remove an item from the Continue Watching list.
    public struct RemoveFromContinueWatching: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "removeFromContinueWatching"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The metadata key of the item
        public var key: String

        public init(
            key: String
        ) {
            self.key = key
        }

        public var path: String { "/actions/removeFromContinueWatching" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = key
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
