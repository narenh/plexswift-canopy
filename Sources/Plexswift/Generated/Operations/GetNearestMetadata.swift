// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get sonically similar items for a music track.
    public struct GetNearestMetadata: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getNearestMetadata"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the item
        public var id: Int

        /// The unique identifier of the excludeparent
        public var excludeParentID: Int?

        /// The unique identifier of the excludegrandparent
        public var excludeGrandparentID: Int?

        /// Maximum number of items to return
        public var limit: Int?

        /// The maxDistance
        public var maxDistance: Double?

        public init(
            id: Int,
            excludeParentID: Int? = nil,
            excludeGrandparentID: Int? = nil,
            limit: Int? = nil,
            maxDistance: Double? = nil
        ) {
            self.id = id
            self.excludeParentID = excludeParentID
            self.excludeGrandparentID = excludeGrandparentID
            self.limit = limit
            self.maxDistance = maxDistance
        }

        public var path: String { "/library/metadata/\(PathComponent(id))/nearest" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = excludeParentID {
                items.append(URLQueryItem(name: "excludeParentID", value: QueryValue(value).encoded))
            }
            if let value = excludeGrandparentID {
                items.append(URLQueryItem(name: "excludeGrandparentID", value: QueryValue(value).encoded))
            }
            if let value = limit {
                items.append(URLQueryItem(name: "limit", value: QueryValue(value).encoded))
            }
            if let value = maxDistance {
                items.append(URLQueryItem(name: "maxDistance", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
