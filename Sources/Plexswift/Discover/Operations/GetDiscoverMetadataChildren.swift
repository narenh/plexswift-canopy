import Foundation

extension Operations {
    /// Get a show's seasons, or a season's episodes, from the metadata provider.
    ///
    /// `GET /library/metadata/{ratingKey}/children` on `metadata.provider.plex.tv`.
    ///
    /// The provider answers for any title, not only the ones the account owns, which is what
    /// makes an episode list possible for a show nobody has.
    public struct GetDiscoverMetadataChildren: PlexOperation {
        public typealias Success = DiscoverItemsResponse

        public static let operationID = "getDiscoverMetadataChildren"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.metadataProvider
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The provider's key for the parent — the show, or the season.
        public var ratingKey: String

        /// Include what the requesting account has done with each child.
        public var includeUserState: Bool?

        /// Query items appended to the request, for parameters this type does not name.
        public var additionalQueryItems: [URLQueryItem]

        public init(
            ratingKey: String,
            includeUserState: Bool? = nil,
            additionalQueryItems: [URLQueryItem] = []
        ) {
            self.ratingKey = ratingKey
            self.includeUserState = includeUserState
            self.additionalQueryItems = additionalQueryItems
        }

        public var path: String { "/library/metadata/\(PathComponent(ratingKey))/children" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = includeUserState {
                items.append(URLQueryItem(name: "includeUserState", value: QueryValue(value).encoded))
            }
            items.append(contentsOf: additionalQueryItems)
            return items
        }
    }
}
