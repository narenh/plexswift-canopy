// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Add items to a collection by uri
    public struct AddCollectionItems: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "addCollectionItems"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The collection id
        public var collectionId: Int

        /// The URI describing the items to add to this collection
        public var uri: String

        public init(
            collectionId: Int,
            uri: String
        ) {
            self.collectionId = collectionId
            self.uri = uri
        }

        public var path: String { "/library/collections/\(PathComponent(collectionId))/items" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = uri
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
