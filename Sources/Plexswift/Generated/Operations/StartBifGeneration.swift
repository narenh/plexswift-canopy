// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Start the indexing (BIF generation) of an item
    public struct StartBifGeneration: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "startBifGeneration"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// Force the operation even if conditions are not met
        public var force: BoolInt?

        public init(
            ids: String,
            force: BoolInt? = nil
        ) {
            self.ids = ids
            self.force = force
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/index" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = force {
                items.append(URLQueryItem(name: "force", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
