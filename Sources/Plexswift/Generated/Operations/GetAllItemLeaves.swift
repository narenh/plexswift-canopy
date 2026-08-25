// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the leaves for a metadata item such as the episodes in a show
    public struct GetAllItemLeaves: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getAllItemLeaves"
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

        public var path: String { "/library/metadata/\(PathComponent(ids))/allLeaves" }
    }
}
