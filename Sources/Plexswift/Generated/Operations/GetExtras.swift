// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the extras for a metadata item
    public struct GetExtras: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getExtras"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        public init(
            ids: String
        ) {
            self.ids = ids
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/extras" }
    }
}
