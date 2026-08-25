// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Merge a metadata item with other items
    public struct MergeItems: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "mergeItems"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// Comma-separated list of item identifiers
        public var ids2: [String]?

        public init(
            ids: String,
            ids2: [String]? = nil
        ) {
            self.ids = ids
            self.ids2 = ids2
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/merge" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = ids2 {
                items.append(URLQueryItem(name: "ids", value: value.map { QueryValue($0).encoded }.joined(separator: ",")))
            }
            return items
        }
    }
}
