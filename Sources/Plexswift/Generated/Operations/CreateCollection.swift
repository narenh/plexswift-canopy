// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Create a collection in the library
    public struct CreateCollection: PlexOperation {
        public typealias Success = CollectionValue

        public static let operationID = "createCollection"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The title to filter by or assign
        public var title: String?

        /// Whether this is a smart collection/playlist
        public var smart: Bool?

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

        /// The section where this collection will be created
        public var sectionId: String

        /// The URI for processing the smart collection. Required for a smart collection
        public var uri: String?

        public init(
            title: String? = nil,
            smart: Bool? = nil,
            type: MediaType? = nil,
            sectionId: String,
            uri: String? = nil
        ) {
            self.title = title
            self.smart = smart
            self.type = type
            self.sectionId = sectionId
            self.uri = uri
        }

        public var path: String { "/library/collections" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = title {
                items.append(URLQueryItem(name: "title", value: QueryValue(value).encoded))
            }
            if let value = smart {
                items.append(URLQueryItem(name: "smart", value: QueryValue(value).encoded))
            }
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            do {
                let value = sectionId
                items.append(URLQueryItem(name: "sectionId", value: QueryValue(value).encoded))
            }
            if let value = uri {
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
