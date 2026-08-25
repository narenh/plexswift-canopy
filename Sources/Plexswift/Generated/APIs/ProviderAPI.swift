// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Provider` operations of the Plex API.
///
/// Reached through ``PlexClient/provider``.
public struct ProviderAPI: Sendable {
    let client: PlexClient

    /// This endpoint registers a media provider with the server. Once registered, the media server acts
    /// as a reverse proxy to the provider, allowing both local and remote providers to work.
    @discardableResult
    public func addProvider(
        url: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.AddProvider(
            url: url
        ))
    }

    /// Add an item to the user's Plex Discover watchlist.
    @discardableResult
    public func addToWatchlist(
        uri: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.AddToWatchlist(
            uri: uri
        ))
    }

    /// Deletes a media provider with the given id
    @discardableResult
    public func deleteMediaProvider(
        provider: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.DeleteMediaProvider(
            provider: provider
        ))
    }

    /// Get the user's Plex Discover watchlist.
    @discardableResult
    public func getWatchlist() async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetWatchlist())
    }

    /// Get the list of all available media providers for this PMS. This will generally include the
    /// library provider and possibly EPG if DVR is set up.
    @discardableResult
    public func listProviders() async throws -> ListProvidersResponse {
        try await client.perform(Operations.ListProviders())
    }

    /// Refresh all known media providers. This is useful in case a provider has updated features.
    @discardableResult
    public func refreshProviders() async throws -> SuccessResponse {
        try await client.perform(Operations.RefreshProviders())
    }

    /// Remove an item from the user's Plex Discover watchlist.
    @discardableResult
    public func removeFromWatchlist(
        uri: String
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.RemoveFromWatchlist(
            uri: uri
        ))
    }

    /// Search movies and shows in Plex Discover.
    @discardableResult
    public func searchDiscover(
        query: String? = nil,
        limit: Int? = nil,
        searchTypes: String? = nil,
        searchProviders: String? = nil,
        includeMetadata: Int? = nil
    ) async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.SearchDiscover(
            query: query,
            limit: limit,
            searchTypes: searchTypes,
            searchProviders: searchProviders,
            includeMetadata: includeMetadata
        ))
    }
}

extension PlexClient {
    /// The `Provider` operations of the Plex API.
    public var provider: ProviderAPI { ProviderAPI(client: self) }
}
