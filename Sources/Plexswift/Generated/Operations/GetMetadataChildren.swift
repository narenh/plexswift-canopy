// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get children of a show, season, artist, or album.
    public struct GetMetadataChildren: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getMetadataChildren"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the item
        public var id: Int

        public init(
            id: Int
        ) {
            self.id = id
        }

        public var path: String { "/library/metadata/\(PathComponent(id))/children" }
    }
}
