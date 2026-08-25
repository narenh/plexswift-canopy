// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Perform a search and get the result as hubs
    ///
    /// This endpoint performs a search across all library sections, or a single section, and returns
    /// matches as hubs, split up by type. It performs spell checking, looks for partial matches, and
    /// orders the hubs based on quality of results. In addition, based on matches, it will return other
    /// related matches (e.g. for a genre match, it may return movies in that genre, or for an actor
    /// match, movies with that actor).
    ///
    /// In the response's items, the following extra attributes are returned to further describe or
    /// disambiguate the result:
    ///
    /// - `reason`: The reason for the result, if not because of a direct search term match; can be either:
    /// - `section`: There are multiple identical results from different sections.
    /// - `originalTitle`: There was a search term match from the original title field (sometimes those can be very different or in a foreign language).
    /// - `<hub identifier>`: If the reason for the result is due to a result in another hub, the source hub identifier is returned. For example, if the search is for "dylan" then Bob Dylan may be returned as an artist result, an a few of his albums returned as album results with a reason code of `artist` (the identifier of that particular hub). Or if the search is for "arnold", there might be movie results returned with a reason of `actor`
    /// - `reasonTitle`: The string associated with the reason code. For a section reason, it'll be the section name; For a hub identifier, it'll be a string associated with the match (e.g. `Arnold Schwarzenegger` for movies which were returned because the search was for "arnold").
    /// - `reasonID`: The ID of the item associated with the reason for the result. This might be a section ID, a tag ID, an artist ID, or a show ID.
    ///
    /// This request is intended to be very fast, and called as the user types.
    public struct SearchHubs: PlexOperation {
        public typealias Success = MediaContainerWithHubs

        public static let operationID = "searchHubs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The query term
        public var query: String

        /// This gives context to the search, and can result in re-ordering of search result hubs.
        public var sectionId: Int?

        /// The number of items to return per hub. 3 if not specified
        public var limit: Int?

        /// Include collection results in search hubs
        public var includeCollections: Bool?

        public init(
            query: String,
            sectionId: Int? = nil,
            limit: Int? = nil,
            includeCollections: Bool? = nil
        ) {
            self.query = query
            self.sectionId = sectionId
            self.limit = limit
            self.includeCollections = includeCollections
        }

        public var path: String { "/hubs/search" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = query
                items.append(URLQueryItem(name: "query", value: QueryValue(value).encoded))
            }
            if let value = sectionId {
                items.append(URLQueryItem(name: "sectionId", value: QueryValue(value).encoded))
            }
            if let value = limit {
                items.append(URLQueryItem(name: "limit", value: QueryValue(value).encoded))
            }
            if let value = includeCollections {
                items.append(URLQueryItem(name: "includeCollections", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
