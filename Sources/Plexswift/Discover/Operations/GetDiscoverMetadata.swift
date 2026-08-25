import Foundation

extension Operations {
    /// Get everything the metadata provider knows about one title.
    ///
    /// `GET /library/metadata/{ratingKey}` on `metadata.provider.plex.tv`.
    ///
    /// This is the endpoint behind a Discover detail screen. What comes back depends on the
    /// `include` flags the request carries: without any, the response is little more than the
    /// title, artwork and a synopsis. Each flag costs the provider work, so ask for what the
    /// screen shows.
    ///
    /// The rating key is the provider's, not a media server's. A key from a Discover search or
    /// hub belongs here; a key from the account's own library does not.
    public struct GetDiscoverMetadata: PlexOperation {
        public typealias Success = DiscoverItemsResponse

        public static let operationID = "getDiscoverMetadata"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.metadataProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The provider's key for the title.
        public var ratingKey: String

        /// Include what the requesting account has done with the title — watched, rated,
        /// watchlisted.
        public var includeUserState: Bool?

        /// Include critics' reviews.
        public var includeReviews: Bool?

        /// Include trailers, featurettes and interviews.
        public var includeExtras: Bool?

        /// Include a show's seasons, or a season's episodes.
        public var includeChildren: Bool?

        /// Include hubs of related titles.
        public var includeRelated: Bool?

        /// How many titles each related hub carries. Only has an effect alongside
        /// ``includeRelated``.
        public var includeRelatedCount: Int?

        /// Include the episode to resume a show from.
        public var includeOnDeck: Bool?

        /// Include where the title can be streamed, rented or bought. Region-specific, so the
        /// answer depends on the account making the request.
        public var includeAvailability: Bool?

        /// Include media held on services other than Plex.
        public var includeExternalMedia: Bool?

        /// Let the provider enrich the record while answering rather than returning what it
        /// has cached.
        public var asyncAugmentMetadata: Bool?

        /// Query items appended to the request, for parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            ratingKey: String,
            includeUserState: Bool? = nil,
            includeReviews: Bool? = nil,
            includeExtras: Bool? = nil,
            includeChildren: Bool? = nil,
            includeRelated: Bool? = nil,
            includeRelatedCount: Int? = nil,
            includeOnDeck: Bool? = nil,
            includeAvailability: Bool? = nil,
            includeExternalMedia: Bool? = nil,
            asyncAugmentMetadata: Bool? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.ratingKey = ratingKey
            self.includeUserState = includeUserState
            self.includeReviews = includeReviews
            self.includeExtras = includeExtras
            self.includeChildren = includeChildren
            self.includeRelated = includeRelated
            self.includeRelatedCount = includeRelatedCount
            self.includeOnDeck = includeOnDeck
            self.includeAvailability = includeAvailability
            self.includeExternalMedia = includeExternalMedia
            self.asyncAugmentMetadata = asyncAugmentMetadata
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { "/library/metadata/\(PathComponent(ratingKey))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = includeUserState {
                items.append(URLQueryItem(name: "includeUserState", value: QueryValue(value).encoded))
            }
            if let value = includeReviews {
                items.append(URLQueryItem(name: "includeReviews", value: QueryValue(value).encoded))
            }
            if let value = includeExtras {
                items.append(URLQueryItem(name: "includeExtras", value: QueryValue(value).encoded))
            }
            if let value = includeChildren {
                items.append(URLQueryItem(name: "includeChildren", value: QueryValue(value).encoded))
            }
            if let value = includeRelated {
                items.append(URLQueryItem(name: "includeRelated", value: QueryValue(value).encoded))
            }
            if let value = includeRelatedCount {
                items.append(
                    URLQueryItem(name: "includeRelatedCount", value: QueryValue(value).encoded)
                )
            }
            if let value = includeOnDeck {
                items.append(URLQueryItem(name: "includeOnDeck", value: QueryValue(value).encoded))
            }
            if let value = includeAvailability {
                items.append(
                    URLQueryItem(name: "includeAvailability", value: QueryValue(value).encoded)
                )
            }
            if let value = includeExternalMedia {
                items.append(
                    URLQueryItem(name: "includeExternalMedia", value: QueryValue(value).encoded)
                )
            }
            if let value = asyncAugmentMetadata {
                items.append(
                    URLQueryItem(name: "asyncAugmentMetadata", value: QueryValue(value).encoded)
                )
            }
            items.append(contentsOf: additionalQueryItems)
            return items
        }
    }
}
