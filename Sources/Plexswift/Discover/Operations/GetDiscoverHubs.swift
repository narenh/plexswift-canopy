import Foundation

extension Operations {
    /// Get a set of Discover hubs — the rows that make up a Discover screen.
    ///
    /// `GET /hubs` on `discover.provider.plex.tv` by default. Pass another key to follow a hub
    /// that groups its contents into further rows rather than listing them.
    public struct GetDiscoverHubs: PlexOperation {
        public typealias Success = DiscoverHubsResponse

        public static let operationID = "getDiscoverHubs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The key to fetch. Defaults to `/hubs`, the root of the Discover screen.
        public var key: String

        /// How many items to return in each hub.
        public var count: Int?

        /// The content directory the hubs are drawn from.
        public var contentDirectoryID: String?

        /// The content directories pinned to the screen, comma-separated.
        public var pinnedContentDirectoryID: String?

        /// Query items appended to the request, for parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            key: String = "/hubs",
            count: Int? = nil,
            contentDirectoryID: String? = nil,
            pinnedContentDirectoryID: String? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.key = key
            self.count = count
            self.contentDirectoryID = contentDirectoryID
            self.pinnedContentDirectoryID = pinnedContentDirectoryID
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { DiscoverProviderPath(key).path }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            if let value = contentDirectoryID {
                items.append(
                    URLQueryItem(name: "contentDirectoryID", value: QueryValue(value).encoded)
                )
            }
            if let value = pinnedContentDirectoryID {
                items.append(
                    URLQueryItem(name: "pinnedContentDirectoryID", value: QueryValue(value).encoded)
                )
            }
            items.append(contentsOf: additionalQueryItems)
            return DiscoverProviderPath(key).queryItems(merging: items)
        }
    }
}
