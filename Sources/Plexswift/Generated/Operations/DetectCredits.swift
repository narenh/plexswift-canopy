// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Start credit detection on a metadata item
    public struct DetectCredits: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "detectCredits"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// Force the operation even if conditions are not met
        public var force: BoolInt?

        /// Whether to perform the operation manually
        public var manual: BoolInt?

        public init(
            ids: String,
            force: BoolInt? = nil,
            manual: BoolInt? = nil
        ) {
            self.ids = ids
            self.force = force
            self.manual = manual
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/credits" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = force {
                items.append(URLQueryItem(name: "force", value: QueryValue(value).encoded))
            }
            if let value = manual {
                items.append(URLQueryItem(name: "manual", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
