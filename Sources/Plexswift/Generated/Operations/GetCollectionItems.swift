// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get items in a collection. Note if this collection contains more than 100 items, paging must be
    /// used.
    public struct GetCollectionItems: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getCollectionItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The collection id
        public var collectionId: Int

        public init(
            collectionId: Int
        ) {
            self.collectionId = collectionId
        }

        public var path: String { "/library/collections/\(PathComponent(collectionId))/items" }
    }
}
