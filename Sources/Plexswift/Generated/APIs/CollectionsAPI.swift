// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Collections` operations of the Plex API.
///
/// Reached through ``PlexClient/collections``.
public struct CollectionsAPI: Sendable {
    let client: PlexClient

    /// Create a collection in the library
    @discardableResult
    public func createCollection(
        title: String? = nil,
        smart: Bool? = nil,
        type: MediaType? = nil,
        sectionId: String,
        uri: String? = nil
    ) async throws(PlexError) -> CollectionValue {
        try await client.perform(Operations.CreateCollection(
            title: title,
            smart: smart,
            type: type,
            sectionId: sectionId,
            uri: uri
        ))
    }
}

extension PlexClient {
    /// The `Collections` operations of the Plex API.
    public var collections: CollectionsAPI { CollectionsAPI(client: self) }
}
