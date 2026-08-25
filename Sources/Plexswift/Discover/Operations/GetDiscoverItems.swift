import Foundation

extension Operations {
    /// Fetch the items behind a Discover key: a hub's contents, a directory's listing, a
    /// person's filmography.
    ///
    /// Discover is walked by following the keys the provider returns — a ``DiscoverHub``'s
    /// ``DiscoverHub/key``, a ``DiscoverDirectory``'s ``DiscoverDirectory/key`` — rather than
    /// by assembling paths, so this operation takes whatever key it was handed. A key that
    /// carries its own query string keeps it.
    public struct GetDiscoverItems: PlexOperation {
        public typealias Success = DiscoverItemsResponse

        public static let operationID = "getDiscoverItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The key to fetch.
        public var key: String

        /// How many items to return.
        public var count: Int?

        /// Where to start, for paging. Sent as `X-Plex-Container-Start`.
        public var offset: Int?

        /// How many items a page holds, for paging. Sent as `X-Plex-Container-Size`.
        ///
        /// Plex pages through these two headers rather than through query parameters, and
        /// answers with the total in `X-Plex-Container-Total-Size` — reachable from
        /// ``PlexResponse/headers`` when the operation is sent with ``PlexClient/send(_:)``.
        public var pageSize: Int?

        /// Query items appended to the request, for the parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            key: String,
            count: Int? = nil,
            offset: Int? = nil,
            pageSize: Int? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.key = key
            self.count = count
            self.offset = offset
            self.pageSize = pageSize
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { DiscoverProviderPath(key).path }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let count {
                items.append(URLQueryItem(name: "count", value: QueryValue(count).encoded))
            }
            items.append(contentsOf: additionalQueryItems)
            return DiscoverProviderPath(key).queryItems(merging: items)
        }

        public var headers: [String: String] {
            var headers: [String: String] = [:]
            if let offset {
                headers["X-Plex-Container-Start"] = QueryValue(offset).encoded
            }
            if let pageSize {
                headers["X-Plex-Container-Size"] = QueryValue(pageSize).encoded
            }
            return headers
        }
    }
}
