import Foundation

extension Operations {
    /// Fetch the account's watchlist from the Discover provider.
    ///
    /// `GET /library/sections/watchlist/all` on `discover.provider.plex.tv`.
    ///
    /// The specification describes this endpoint too, as ``Operations/GetWatchlist``, and that
    /// operation decodes into the media server's ``Metadata``. This one decodes into
    /// ``DiscoverMetadata``, which is the type the rest of Discover returns — so a watchlist
    /// entry can be handed to ``DiscoverAPI/metadata(ratingKey:including:relatedCount:)``
    /// without translation, and carries the availability and slug fields the media server's
    /// model has no place for.
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

        /// Where to start, for paging. Sent as `X-Plex-Container-Start`.
        public var offset: Int?

        /// How many entries a page holds. Sent as `X-Plex-Container-Size`.
        public var pageSize: Int?

        /// Which optional sections to ask for on each entry.
        public var inclusions: DiscoverMetadataInclusions

        /// Query items appended to the request, for the parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            filter: String? = nil,
            libtype: String? = nil,
            sort: String? = nil,
            offset: Int? = nil,
            pageSize: Int? = nil,
            inclusions: DiscoverMetadataInclusions = .none,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.filter = filter
            self.libtype = libtype
            self.sort = sort
            self.offset = offset
            self.pageSize = pageSize
            self.inclusions = inclusions
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { "/library/sections/watchlist/all" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let filter {
                items.append(URLQueryItem(name: "filter", value: QueryValue(filter).encoded))
            }
            if let libtype {
                items.append(URLQueryItem(name: "libtype", value: QueryValue(libtype).encoded))
            }
            if let sort {
                items.append(URLQueryItem(name: "sort", value: QueryValue(sort).encoded))
            }
            items.append(contentsOf: inclusions.queryItems)
            items.append(contentsOf: additionalQueryItems)
            return items
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
