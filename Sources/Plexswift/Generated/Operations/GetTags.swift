// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get all library tags of a type
    public struct GetTags: PlexOperation {
        public typealias Success = GetTagsResponse

        public static let operationID = "getTags"
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

        public init(
            type: MediaType? = nil
        ) {
            self.type = type
        }

        public var path: String { "/library/tags" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
