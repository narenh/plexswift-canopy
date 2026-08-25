// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the nearest audio tracks to a particular analysis
    public struct GetSonicallySimilar: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getSonicallySimilar"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Section identifier
        public var sectionId: Int

        /// The metadata type to fetch (should be 10 for audio track)
        public var type: Int?

        /// The music analysis to center the search. Typically obtained from the `musicAnalysis` of a track
        public var values: [Int]

        /// The limit of the number of items to fetch; defaults to 50
        public var limit: Int?

        /// The maximum distance to search, defaults to 0.25
        public var maxDistance: Double?

        public init(
            sectionId: Int,
            type: Int? = nil,
            values: [Int],
            limit: Int? = nil,
            maxDistance: Double? = nil
        ) {
            self.sectionId = sectionId
            self.type = type
            self.values = values
            self.limit = limit
            self.maxDistance = maxDistance
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/nearest" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            do {
                let value = values
                items.append(URLQueryItem(name: "values", value: value.map { QueryValue($0).encoded }.joined(separator: ",")))
            }
            if let value = limit {
                items.append(URLQueryItem(name: "limit", value: QueryValue(value).encoded))
            }
            if let value = maxDistance {
                items.append(URLQueryItem(name: "maxDistance", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
