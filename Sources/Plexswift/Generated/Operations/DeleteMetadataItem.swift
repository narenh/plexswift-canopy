// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a single metadata item from the library, deleting media as well
    public struct DeleteMetadataItem: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteMetadataItem"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// Whether proxy items, such as media optimized versions, should also be deleted. Defaults to
        /// false.
        public var proxy: BoolInt?

        public init(
            ids: String,
            proxy: BoolInt? = nil
        ) {
            self.ids = ids
            self.proxy = proxy
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = proxy {
                items.append(URLQueryItem(name: "proxy", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
