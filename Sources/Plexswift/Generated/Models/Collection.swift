// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A collection of related media items.
public struct Collection: Codable, Hashable, Sendable {
    /// Blur hash for collection art.
    public let artBlurHash: String?

    /// Whether the smart collection filter is based on the current user.
    public let collectionFilterBasedOnUser: Bool?

    /// Display mode for the collection.
    public let collectionMode: CollectionCollectionMode?

    /// Whether the collection is published to Plex Discover.
    public let collectionPublished: Bool?

    /// Sort order for items in the collection.
    public let collectionSort: String?

    /// Timestamp of the last user rating.
    public let lastRatedAt: Int?

    /// Blur hash for collection thumbnail.
    public let thumbBlurHash: String?

    /// User star rating (0-10).
    public let userRating: Double?

    public init(
        artBlurHash: String? = nil,
        collectionFilterBasedOnUser: Bool? = nil,
        collectionMode: CollectionCollectionMode? = nil,
        collectionPublished: Bool? = nil,
        collectionSort: String? = nil,
        lastRatedAt: Int? = nil,
        thumbBlurHash: String? = nil,
        userRating: Double? = nil
    ) {
        self.artBlurHash = artBlurHash
        self.collectionFilterBasedOnUser = collectionFilterBasedOnUser
        self.collectionMode = collectionMode
        self.collectionPublished = collectionPublished
        self.collectionSort = collectionSort
        self.lastRatedAt = lastRatedAt
        self.thumbBlurHash = thumbBlurHash
        self.userRating = userRating
    }
}
