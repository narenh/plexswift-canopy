// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of metadata matches for a metadata item
    public struct ListMatches: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "listMatches"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The title to filter by
        public var title: String?

        /// The parentTitle
        public var parentTitle: String?

        /// The identifier of the metadata agent to use
        public var agent: String?

        /// The language code to use
        public var language: String?

        /// The year to filter by
        public var year: Int?

        /// Whether to perform the operation manually
        public var manual: BoolInt?

        public init(
            ids: String,
            title: String? = nil,
            parentTitle: String? = nil,
            agent: String? = nil,
            language: String? = nil,
            year: Int? = nil,
            manual: BoolInt? = nil
        ) {
            self.ids = ids
            self.title = title
            self.parentTitle = parentTitle
            self.agent = agent
            self.language = language
            self.year = year
            self.manual = manual
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/matches" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = title {
                items.append(URLQueryItem(name: "title", value: QueryValue(value).encoded))
            }
            if let value = parentTitle {
                items.append(URLQueryItem(name: "parentTitle", value: QueryValue(value).encoded))
            }
            if let value = agent {
                items.append(URLQueryItem(name: "agent", value: QueryValue(value).encoded))
            }
            if let value = language {
                items.append(URLQueryItem(name: "language", value: QueryValue(value).encoded))
            }
            if let value = year {
                items.append(URLQueryItem(name: "year", value: QueryValue(value).encoded))
            }
            if let value = manual {
                items.append(URLQueryItem(name: "manual", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
