// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Search movies and shows in Plex Discover.
    public struct SearchDiscover: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "searchDiscover"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The search query string
        public var query: String?

        /// Maximum number of items to return
        public var limit: Int?

        /// Types of content to search for
        public var searchTypes: String?

        /// Providers to include in the search
        public var searchProviders: String?

        /// Include metadata in the search results
        public var includeMetadata: Int?

        public init(
            query: String? = nil,
            limit: Int? = nil,
            searchTypes: String? = nil,
            searchProviders: String? = nil,
            includeMetadata: Int? = nil
        ) {
            self.query = query
            self.limit = limit
            self.searchTypes = searchTypes
            self.searchProviders = searchProviders
            self.includeMetadata = includeMetadata
        }

        public var path: String { "/library/search" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = query {
                items.append(URLQueryItem(name: "query", value: QueryValue(value).encoded))
            }
            if let value = limit {
                items.append(URLQueryItem(name: "limit", value: QueryValue(value).encoded))
            }
            if let value = searchTypes {
                items.append(URLQueryItem(name: "searchTypes", value: QueryValue(value).encoded))
            }
            if let value = searchProviders {
                items.append(URLQueryItem(name: "searchProviders", value: QueryValue(value).encoded))
            }
            if let value = includeMetadata {
                items.append(URLQueryItem(name: "includeMetadata", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
