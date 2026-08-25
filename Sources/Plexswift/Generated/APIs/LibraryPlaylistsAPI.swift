// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Library Playlists` operations of the Plex API.
///
/// Reached through ``PlexClient/libraryPlaylists``.
public struct LibraryPlaylistsAPI: Sendable {
    let client: PlexClient

    /// Adds a generator to a playlist, same parameters as the POST above. With a dumb playlist, this
    /// adds the specified items to the playlist. With a smart playlist, passing a new `uri` parameter
    /// replaces the rules for the playlist. Returns the playlist.
    @discardableResult
    public func addPlaylistItems(
        playlistId: Int,
        uri: String? = nil,
        playQueueID: Int? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.AddPlaylistItems(
            playlistId: playlistId,
            uri: uri,
            playQueueID: playQueueID
        ))
    }

    /// Clears a playlist, only works with dumb playlists. Returns the playlist.
    @discardableResult
    public func clearPlaylistItems(
        playlistId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.ClearPlaylistItems(
            playlistId: playlistId
        ))
    }

    /// Create a new playlist. By default the playlist is blank.
    @discardableResult
    public func createPlaylist(
        uri: String? = nil,
        playQueueID: Int? = nil
    ) async throws -> MediaContainerWithPlaylistMetadata {
        try await client.perform(Operations.CreatePlaylist(
            uri: uri,
            playQueueID: playQueueID
        ))
    }

    /// Deletes a playlist by provided id
    @discardableResult
    public func deletePlaylist(
        playlistId: Int
    ) async throws -> EmptyResponse {
        try await client.perform(Operations.DeletePlaylist(
            playlistId: playlistId
        ))
    }

    /// Deletes an item from a playlist. Only works with dumb playlists.
    @discardableResult
    public func deletePlaylistItem(
        playlistId: Int,
        generatorId: Int
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.DeletePlaylistItem(
            playlistId: playlistId,
            generatorId: generatorId
        ))
    }

    /// Get a playlist's generator. Only used for optimized versions
    @discardableResult
    public func getPlaylistGenerator(
        playlistId: Int,
        generatorId: Int
    ) async throws -> GetPlaylistGeneratorResponse {
        try await client.perform(Operations.GetPlaylistGenerator(
            playlistId: playlistId,
            generatorId: generatorId
        ))
    }

    /// Get a playlist generator's items
    @discardableResult
    public func getPlaylistGeneratorItems(
        playlistId: Int,
        generatorId: Int
    ) async throws -> GetPlaylistGeneratorItemsResponse {
        try await client.perform(Operations.GetPlaylistGeneratorItems(
            playlistId: playlistId,
            generatorId: generatorId
        ))
    }

    /// Get all the generators in a playlist
    @discardableResult
    public func getPlaylistGenerators(
        playlistId: Int
    ) async throws -> GetPlaylistGeneratorsResponse {
        try await client.perform(Operations.GetPlaylistGenerators(
            playlistId: playlistId
        ))
    }

    /// Modify a playlist generator. Only used for optimizer
    @discardableResult
    public func modifyPlaylistGenerator(
        playlistId: Int,
        generatorId: Int,
        item: ModifyPlaylistGeneratorItem? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.ModifyPlaylistGenerator(
            playlistId: playlistId,
            generatorId: generatorId,
            item: item
        ))
    }

    /// Moves an item in a playlist. Only works with dumb playlists.
    @discardableResult
    public func movePlaylistItem(
        playlistId: Int,
        playlistItemId: Int,
        after: Int? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.MovePlaylistItem(
            playlistId: playlistId,
            playlistItemId: playlistItemId,
            after: after
        ))
    }

    /// Make a generator reprocess (refresh)
    @discardableResult
    public func refreshPlaylist(
        playlistId: Int,
        generatorId: Int,
        metadataId: Int,
        action: RefreshPlaylistAction
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.RefreshPlaylist(
            playlistId: playlistId,
            generatorId: generatorId,
            metadataId: metadataId,
            action: action
        ))
    }

    /// Edits a playlist in the same manner as [editing
    /// metadata](#tag/Provider/operation/metadataPutItem)
    @discardableResult
    public func updatePlaylist(
        playlistId: Int
    ) async throws -> EmptyResponse {
        try await client.perform(Operations.UpdatePlaylist(
            playlistId: playlistId
        ))
    }

    /// Imports m3u playlists by passing a path on the server to scan for m3u-formatted playlist files,
    /// or a path to a single playlist file.
    @discardableResult
    public func uploadPlaylist(
        path2: String? = nil,
        force: BoolInt? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.UploadPlaylist(
            path2: path2,
            force: force
        ))
    }
}

extension PlexClient {
    /// The `Library Playlists` operations of the Plex API.
    public var libraryPlaylists: LibraryPlaylistsAPI { LibraryPlaylistsAPI(client: self) }
}
