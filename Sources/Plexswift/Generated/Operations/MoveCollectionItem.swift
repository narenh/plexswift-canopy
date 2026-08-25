// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Reorder items in a collection with one item after another
    public struct MoveCollectionItem: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "moveCollectionItem"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The collection id
        public var collectionId: Int

        /// The item to move
        public var itemId: Int

        /// The item to move this item after. If not provided, this item will be moved to the beginning
        public var after: Int?

        public init(
            collectionId: Int,
            itemId: Int,
            after: Int? = nil
        ) {
            self.collectionId = collectionId
            self.itemId = itemId
            self.after = after
        }

        public var path: String { "/library/collections/\(PathComponent(collectionId))/items/\(PathComponent(itemId))/move" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = after {
                items.append(URLQueryItem(name: "after", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
