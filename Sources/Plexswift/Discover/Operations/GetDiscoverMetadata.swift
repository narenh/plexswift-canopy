import Foundation

extension Operations {
    /// Fetch everything the metadata provider knows about one title.
    ///
    /// `GET /library/metadata/{ratingKey}` on `metadata.provider.plex.tv`.
    ///
    /// This is the endpoint behind a Discover detail screen. What comes back depends on the
    /// inclusions asked for: without any, the response is little more than the title, artwork
    /// and a synopsis. See ``DiscoverMetadataInclusions``.
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

        /// Which optional sections to ask for.
        public var inclusions: DiscoverMetadataInclusions

        /// How many related titles each related hub should carry. Only has an effect
        /// alongside ``DiscoverMetadataInclusions/related``.
        public var relatedCount: Int?

        /// Query items appended to the request, for the parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            ratingKey: String,
            inclusions: DiscoverMetadataInclusions = .standard,
            relatedCount: Int? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.ratingKey = ratingKey
            self.inclusions = inclusions
            self.relatedCount = relatedCount
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { "/library/metadata/\(PathComponent(ratingKey))" }

        public var queryItems: [URLQueryItem] {
            var items = inclusions.queryItems
            if let relatedCount, inclusions.contains(.related) {
                items.append(
                    URLQueryItem(name: "includeRelatedCount", value: QueryValue(relatedCount).encoded)
                )
            }
            items.append(contentsOf: additionalQueryItems)
            return items
        }
    }
}
