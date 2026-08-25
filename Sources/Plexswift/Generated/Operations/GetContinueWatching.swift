// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the global continue watching hub
    public struct GetContinueWatching: PlexOperation {
        public typealias Success = MediaContainerWithHubs

        public static let operationID = "getContinueWatching"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Limit results to count items
        public var count: Int?

        public init(
            count: Int? = nil
        ) {
            self.count = count
        }

        public var path: String { "/hubs/continueWatching" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
