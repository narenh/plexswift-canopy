// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the rating on an item.
    /// This API does respond to the GET verb but applications should use PUT
    public struct SetRating: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "setRating"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The identifier of the media provider containing the media to rate. Typically
        /// `com.plexapp.plugins.library`
        public var identifier: String

        /// The key of the item to rate. This is the `ratingKey` found in metadata items
        public var key: String

        /// The rating to give the item.
        public var rating: Double

        /// The time when the rating occurred. If not present, interpreted as now.
        public var ratedAt: Int?

        public init(
            identifier: String,
            key: String,
            rating: Double,
            ratedAt: Int? = nil
        ) {
            self.identifier = identifier
            self.key = key
            self.rating = rating
            self.ratedAt = ratedAt
        }

        public var path: String { "/:/rate" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = identifier
                items.append(URLQueryItem(name: "identifier", value: QueryValue(value).encoded))
            }
            do {
                let value = key
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
            }
            do {
                let value = rating
                items.append(URLQueryItem(name: "rating", value: QueryValue(value).encoded))
            }
            if let value = ratedAt {
                items.append(URLQueryItem(name: "ratedAt", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
