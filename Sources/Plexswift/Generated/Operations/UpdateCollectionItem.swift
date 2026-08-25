// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete an item from a collection
    public struct UpdateCollectionItem: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "updateCollectionItem"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The collection id
        public var collectionId: Int

        /// The item to delete
        public var itemId: Int

        public init(
            collectionId: Int,
            itemId: Int
        ) {
            self.collectionId = collectionId
            self.itemId = itemId
        }

        public var path: String { "/library/collections/\(PathComponent(collectionId))/items/\(PathComponent(itemId))" }
    }
}
