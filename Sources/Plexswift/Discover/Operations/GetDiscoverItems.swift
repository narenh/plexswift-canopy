import Foundation

extension Operations {
    /// Get the items behind a Discover key: a hub's contents, a directory's listing, a person's
    /// filmography.
    ///
    /// Discover is walked by following the keys the provider returns — a ``DiscoverHub``'s
    /// ``DiscoverHub/key``, a ``DiscoverDirectory``'s ``DiscoverDirectory/key`` — rather than by
    /// assembling paths from templates, so this operation takes whatever key it was handed. A
    /// key that carries its own query string keeps it.
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

        /// Where the returned page starts. Sent as `X-Plex-Container-Start`.
        public var containerStart: Int?

        /// How many items the page holds. Sent as `X-Plex-Container-Size`.
        ///
        /// Plex pages these endpoints through the two container headers rather than through
        /// query parameters, and answers with the total in `X-Plex-Container-Total-Size` —
        /// reachable from ``PlexResponse/headers`` when the operation is sent with
        /// ``PlexClient/send(_:)``.
        public var containerSize: Int?

        /// Query items appended to the request, for parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            key: String,
            count: Int? = nil,
            containerStart: Int? = nil,
            containerSize: Int? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.key = key
            self.count = count
            self.containerStart = containerStart
            self.containerSize = containerSize
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { DiscoverProviderPath(key).path }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = count {
                items.append(URLQueryItem(name: "count", value: QueryValue(value).encoded))
            }
            items.append(contentsOf: additionalQueryItems)
            return DiscoverProviderPath(key).queryItems(merging: items)
        }

        public var headers: [String: String] {
            DiscoverContainerPaging(start: containerStart, size: containerSize).headers
        }
    }
}
