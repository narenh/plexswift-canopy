// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Playlists` operations of the Plex API.
///
/// Reached through ``PlexClient/playlists``.
public struct PlaylistsAPI: Sendable {
    let client: PlexClient

    /// Delete a playlist.
    @discardableResult
    public func deletePlaylistByRatingKey(
        ratingKey: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeletePlaylistByRatingKey(
            ratingKey: ratingKey
        ))
    }
}

extension PlexClient {
    /// The `Playlists` operations of the Plex API.
    public var playlists: PlaylistsAPI { PlaylistsAPI(client: self) }
}
