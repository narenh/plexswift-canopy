// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the items within a single hub specified by identifier
    public struct GetHubItems: PlexOperation {
        public typealias Success = GetHubItemsResponse

        public static let operationID = "getHubItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Limit results to count items
        public var count: Int?

        /// If provided, limit to only specified hubs
        public var identifier: [String]

        public init(
            count: Int? = nil,
            identifier: [String]
        ) {
            self.count = count
            self.identifier = identifier
        }

        public var path: String { "/hubs/items" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            do {
                let value = identifier
                for element in value {
                    items.append(URLQueryItem(name: "identifier", value: QueryValue(element).encoded))
                }
            }
            return items
        }
    }
}
