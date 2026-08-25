// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Perform a search tailored to voice input and get the result as hubs
    ///
    /// This endpoint performs a search specifically tailored towards voice or other imprecise input
    /// which may work badly with the substring and spell-checking heuristics used by the `/hubs/search`
    /// endpoint. It uses a [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
    /// heuristic to search titles, and as such is much slower than the other search endpoint. Whenever
    /// possible, clients should limit the search to the appropriate type.
    ///
    /// Results, as well as their containing per-type hubs, contain a `distance` attribute which can be
    /// used to judge result quality.
    public struct VoiceSearchHubs: PlexOperation {
        public typealias Success = MediaContainerWithHubs

        public static let operationID = "voiceSearchHubs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The type of media to retrieve or filter by.
        ///
        /// 1 = movie
        /// 2 = show
        /// 3 = season
        /// 4 = episode
        /// 5 = artist
        /// 6 = album
        /// 7 = track
        /// 8 = photo_album
        /// 9 = photo
        ///
        /// E.g. A movie library will not return anything with type 3 as there are no seasons for movie
        /// libraries
        public var type: MediaType?

        /// The query term
        public var query: String

        /// The number of items to return per hub. 3 if not specified
        public var limit: Int?

        /// Include collection results in search hubs
        public var includeCollections: Bool?

        public init(
            type: MediaType? = nil,
            query: String,
            limit: Int? = nil,
            includeCollections: Bool? = nil
        ) {
            self.type = type
            self.query = query
            self.limit = limit
            self.includeCollections = includeCollections
        }

        public var path: String { "/hubs/search/voice" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            do {
                let value = query
                items.append(URLQueryItem(name: "query", value: QueryValue(value).encoded))
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
