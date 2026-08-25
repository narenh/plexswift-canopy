// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Playlist` operations of the Plex API.
///
/// Reached through ``PlexClient/playlist``.
public struct PlaylistAPI: Sendable {
    let client: PlexClient

    /// Gets detailed metadata for a playlist. A playlist for many purposes (rating, editing metadata,
    /// tagging), can be treated like a regular metadata item:
    /// Smart playlist details contain the `content` attribute. This is the content URI for the
    /// generator. This can then be parsed by a client to provide smart playlist editing.
    @discardableResult
    public func getPlaylist(
        playlistId: Int
    ) async throws(PlexError) -> MediaContainerWithPlaylistMetadata {
        try await client.perform(Operations.GetPlaylist(
            playlistId: playlistId
        ))
    }

    /// Gets the contents of a playlist. Should be paged by clients via standard mechanisms. By default
    /// leaves are returned (e.g. episodes, movies). In order to return other types you can use the
    /// `type` parameter. For example, you could use this to display a list of recently added albums vis
    /// a smart playlist. Note that for dumb playlists, items have a `playlistItemID` attribute which is
    /// used for deleting or moving items.
    @discardableResult
    public func getPlaylistItems(
        playlistId: Int,
        type: [Int]? = nil
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetPlaylistItems(
            playlistId: playlistId,
            type: type
        ))
    }

    /// Gets a list of playlists and playlist folders for a user. General filters are permitted, such as
    /// `sort=lastViewedAt:desc`. A flat playlist list can be retrieved using `type=15` to limit the
    /// collection to just playlists.
    @discardableResult
    public func listPlaylists(
        smart: Bool? = nil,
        playlistType: ListPlaylistsPlaylistType? = nil,
        type: Int? = nil
    ) async throws(PlexError) -> MediaContainerWithPlaylistMetadata {
        try await client.perform(Operations.ListPlaylists(
            smart: smart,
            playlistType: playlistType,
            type: type
        ))
    }
}

extension PlexClient {
    /// The `Playlist` operations of the Plex API.
    public var playlist: PlaylistAPI { PlaylistAPI(client: self) }
}
