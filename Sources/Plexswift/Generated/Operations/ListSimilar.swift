// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a list of similar items to a metadata item
    public struct ListSimilar: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "listSimilar"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Limit results to count items
        public var count: Int?

        /// Comma-separated list of IDs
        public var ids: String

        public init(
            count: Int? = nil,
            ids: String
        ) {
            self.count = count
            self.ids = ids
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/similar" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
