// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Library Collections` operations of the Plex API.
///
/// Reached through ``PlexClient/libraryCollections``.
public struct LibraryCollectionsAPI: Sendable {
    let client: PlexClient

    /// Add items to a collection by uri
    @discardableResult
    public func addCollectionItems(
        collectionId: Int,
        uri: String
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.AddCollectionItems(
            collectionId: collectionId,
            uri: uri
        ))
    }

    /// Reorder items in a collection with one item after another
    @discardableResult
    public func moveCollectionItem(
        collectionId: Int,
        itemId: Int,
        after: Int? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.MoveCollectionItem(
            collectionId: collectionId,
            itemId: itemId,
            after: after
        ))
    }

    /// Delete an item from a collection
    @discardableResult
    public func updateCollectionItem(
        collectionId: Int,
        itemId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.UpdateCollectionItem(
            collectionId: collectionId,
            itemId: itemId
        ))
    }
}

extension PlexClient {
    /// The `Library Collections` operations of the Plex API.
    public var libraryCollections: LibraryCollectionsAPI { LibraryCollectionsAPI(client: self) }
}
