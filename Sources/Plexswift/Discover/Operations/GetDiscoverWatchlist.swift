import Foundation

extension Operations {
    /// Get the account's Plex Discover watchlist.
    ///
    /// `GET /library/sections/watchlist/all` on `discover.provider.plex.tv`.
    ///
    /// The specification describes this endpoint too, as ``Operations/GetWatchlist``, which
    /// decodes into the media server's ``Metadata``. This one decodes into
    /// ``DiscoverMetadata``, the type the rest of Discover returns — so an entry can be handed
    /// straight to ``Operations/GetDiscoverMetadata`` without translation, and keeps the
    /// availability and slug fields the media server's model has no place for.
    ///
    /// Adding and removing entries are specified operations, at
    /// ``ProviderAPI/addToWatchlist(uri:)`` and ``ProviderAPI/removeFromWatchlist(uri:)``.
    public struct GetDiscoverWatchlist: PlexOperation {
        public typealias Success = DiscoverItemsResponse

        public static let operationID = "getDiscoverWatchlist"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.discoverProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Which entries to return: `all`, `available`, or `released`.
        public var filter: String?

        /// Which kind of entry to return: `movie` or `show`.
        public var libtype: String?

        /// How to order the result, as Plex's `field:direction` — `titleSort:asc`,
        /// `watchlistedAt:desc`.
        public var sort: String?

        /// Where the returned page starts. Sent as `X-Plex-Container-Start`.
        public var containerStart: Int?

        /// How many entries the page holds. Sent as `X-Plex-Container-Size`.
        public var containerSize: Int?

        /// Query items appended to the request, for parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            filter: String? = nil,
            libtype: String? = nil,
            sort: String? = nil,
            containerStart: Int? = nil,
            containerSize: Int? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.filter = filter
            self.libtype = libtype
            self.sort = sort
            self.containerStart = containerStart
            self.containerSize = containerSize
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { "/library/sections/watchlist/all" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = filter {
                items.append(URLQueryItem(name: "filter", value: QueryValue(value).encoded))
            }
            if let value = libtype {
                items.append(URLQueryItem(name: "libtype", value: QueryValue(value).encoded))
            }
            if let value = sort {
                items.append(URLQueryItem(name: "sort", value: QueryValue(value).encoded))
            }
            items.append(contentsOf: additionalQueryItems)
            return items
        }

        public var headers: [String: String] {
            DiscoverContainerPaging(start: containerStart, size: containerSize).headers
        }
    }
}
