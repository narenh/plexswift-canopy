import Foundation

extension Operations {
    /// Search Plex Discover for titles, whether or not the account owns them.
    ///
    /// `GET /library/search` on `discover.provider.plex.tv`.
    ///
    /// The specification also describes this endpoint, as ``Operations/SearchDiscover``, but
    /// types its response as a plain metadata container. The provider actually answers with
    /// scored results grouped by source, which is what ``DiscoverSearchResponse`` decodes —
    /// so a search made through the generated operation returns an empty container even when
    /// there were matches.
    public struct DiscoverSearch: PlexOperation {
        public typealias Success = DiscoverSearchResponse

        public static let operationID = "discoverSearch"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// What to search for.
        public var query: String

        /// How many results to return.
        public var limit: Int?

        /// The kinds of thing to match, as a comma-separated list: `movies`, `tv`, `people`.
        public var searchTypes: String?

        /// Which providers to search, as a comma-separated list. `discover` is Plex's own
        /// catalogue; `plexAVOD` and `plexTVOD` are its free and paid services.
        public var searchProviders: String?

        /// Whether to include each match's metadata rather than its identity alone.
        public var includeMetadata: Bool?

        public init(
            query: String,
            limit: Int? = nil,
            searchTypes: String? = nil,
            searchProviders: String? = nil,
            includeMetadata: Bool? = nil
        ) {
            self.query = query
            self.limit = limit
            self.searchTypes = searchTypes
            self.searchProviders = searchProviders
            self.includeMetadata = includeMetadata
        }

        public var path: String { "/library/search" }

        public var queryItems: [URLQueryItem] {
            var items = [URLQueryItem(name: "query", value: QueryValue(query).encoded)]
            if let limit {
                items.append(URLQueryItem(name: "limit", value: QueryValue(limit).encoded))
            }
            if let searchTypes {
                items.append(URLQueryItem(name: "searchTypes", value: QueryValue(searchTypes).encoded))
            }
            if let searchProviders {
                items.append(
                    URLQueryItem(name: "searchProviders", value: QueryValue(searchProviders).encoded)
                )
            }
            if let includeMetadata {
                items.append(
                    URLQueryItem(name: "includeMetadata", value: QueryValue(includeMetadata).encoded)
                )
            }
            return items
        }
    }
}
