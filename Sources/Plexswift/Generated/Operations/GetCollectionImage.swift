// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get an image for the collection based on the items within
    public struct GetCollectionImage: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getCollectionImage"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var composite: GetCollectionImageComposite?

        /// The collection id
        public var collectionId: Int

        /// The update time of the image. Used for busting cache.
        public var updatedAt: Int

        public init(
            composite: GetCollectionImageComposite? = nil,
            collectionId: Int,
            updatedAt: Int
        ) {
            self.composite = composite
            self.collectionId = collectionId
            self.updatedAt = updatedAt
        }

        public var path: String { "/library/collections/\(PathComponent(collectionId))/composite/\(PathComponent(updatedAt))" }

        public var queryItems: [URLQueryItem] { get throws {
            var items: [URLQueryItem] = []
            if let value = composite {
                items.append(contentsOf: try DeepObjectQuery.items(name: "composite", value: value))
            }
            return items
        } }
    }
}
