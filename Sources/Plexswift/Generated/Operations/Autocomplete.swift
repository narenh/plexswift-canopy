// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// The field to autocomplete on is specified by the `{field}.query` parameter. For example
    /// `genre.query` or `title.query`.
    /// Returns a set of items from the filtered items whose `{field}` starts with `{field}.query`. In
    /// the results, a `{field}.queryRange` will be present to express the range of the match
    public struct Autocomplete: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "autocomplete"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// A querystring-based filtering language used to select subsets of media. Can be provided as an
        /// object with typed properties for type safety, or as a string for complex queries with operators
        /// and boolean logic.
        ///
        /// The query supports:
        /// - Fields: integer, boolean, tag, string, date, language
        /// - Operators: =, !=, ==, !==, <=, >=, >>=, <<= (varies by field type)
        /// - Boolean operators: & (AND), , (OR), push/pop (parentheses), or=1 (explicit OR)
        /// - Sorting: sort parameter with :desc, :nullsLast modifiers
        /// - Grouping: group parameter
        /// - Limits: limit parameter
        ///
        /// Examples:
        /// - Object format: `{type: 4, sourceType: 2, title: "24"}` → `type=4&sourceType=2&title=24`
        /// - String format: `type=4&sourceType=2&title==24` - type = 4 AND sourceType = 2 AND title = "24"
        /// - Complex: `push=1&index=1&or=1&rating=2&pop=1&duration=10` - (index = 1 OR rating = 2) AND duration = 10
        ///
        /// See [API Info section](#section/API-Info/Media-Queries) for detailed information on building
        /// media queries.
        public var mediaQuery: MediaQuery?

        /// Section identifier
        public var sectionId: Int

        /// The "field" stands in for any field, the value is a partial string for matching
        public var fieldQuery: String?

        public init(
            mediaQuery: MediaQuery? = nil,
            sectionId: Int,
            fieldQuery: String? = nil
        ) {
            self.mediaQuery = mediaQuery
            self.sectionId = sectionId
            self.fieldQuery = fieldQuery
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/autocomplete" }

        public var queryItems: [URLQueryItem] { get throws {
            var items: [URLQueryItem] = []
            if let value = mediaQuery {
                items.append(contentsOf: try DeepObjectQuery.items(name: "mediaQuery", value: value))
            }
            if let value = fieldQuery {
                items.append(URLQueryItem(name: "field.query", value: QueryValue(value).encoded))
            }
            return items
        } }
    }
}
