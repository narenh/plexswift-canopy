// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Match a metadata item to a guid
    public struct MatchItem: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "matchItem"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The guid
        public var guid: String?

        /// The name
        public var name: String?

        /// The year to filter by
        public var year: Int?

        public init(
            ids: String,
            guid: String? = nil,
            name: String? = nil,
            year: Int? = nil
        ) {
            self.ids = ids
            self.guid = guid
            self.name = name
            self.year = year
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/match" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = guid {
                items.append(URLQueryItem(name: "guid", value: QueryValue(value).encoded))
            }
            if let value = name {
                items.append(URLQueryItem(name: "name", value: QueryValue(value).encoded))
            }
            if let value = year {
                items.append(URLQueryItem(name: "year", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
