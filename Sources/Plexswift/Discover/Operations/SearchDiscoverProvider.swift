import Foundation

extension Operations {
    /// Search movies and shows in Plex Discover.
    ///
    /// `GET /library/search` on `discover.provider.plex.tv`.
    ///
    /// The specification describes this endpoint as ``Operations/SearchDiscover``, whose name
    /// this one therefore cannot take. The difference is the response: the specification types
    /// it as a plain metadata container, where the provider answers with scored results grouped
    /// by source. The generated operation decodes to an empty container even when there were
    /// matches; this one decodes to ``DiscoverSearchResponse``.
    public struct SearchDiscoverProvider: PlexOperation {
        public typealias Success = DiscoverSearchResponse

        public static let operationID = "searchDiscoverProvider"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The search query string
        public var query: String

        /// Maximum number of items to return
        public var limit: Int?

        /// Types of content to search for, comma-separated: `movies`, `tv`, `people`, `music`
        public var searchTypes: String?

        /// Providers to include in the search, comma-separated. `discover` is Plex's own
        /// catalogue.
        public var searchProviders: String?

        /// Include metadata in the search results
        public var includeMetadata: Bool?

        /// Query items appended to the request, for parameters this type does not name.
        ///
        /// The providers accept flags that are documented nowhere, this package included.
        /// Rather than require a fork of the SDK to try one, pass it through.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            query: String,
            limit: Int? = nil,
            searchTypes: String? = nil,
            searchProviders: String? = nil,
            includeMetadata: Bool? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.query = query
            self.limit = limit
            self.searchTypes = searchTypes
            self.searchProviders = searchProviders
            self.includeMetadata = includeMetadata
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { "/library/search" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            items.append(URLQueryItem(name: "query", value: QueryValue(query).encoded))
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
            items.append(contentsOf: additionalQueryItems)
            return items
        }
    }
}
