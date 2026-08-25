// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Plex` operations of the Plex API.
///
/// Reached through ``PlexClient/plex``.
public struct PlexAPI: Sendable {
    let client: PlexClient

    /// Get Plex server access tokens and server connections
    @discardableResult
    public func getServerResources(
        includeHttps: GetServerResourcesIncludeHttps? = nil,
        includeRelay: GetServerResourcesIncludeRelay? = nil,
        includeIPv6: GetServerResourcesIncludeIPv6? = nil
    ) async throws -> [PlexDevice] {
        try await client.perform(Operations.GetServerResources(
            includeHttps: includeHttps,
            includeRelay: includeRelay,
            includeIPv6: includeIPv6
        ))
    }
}

extension PlexClient {
    /// The `Plex` operations of the Plex API.
    public var plex: PlexAPI { PlexAPI(client: self) }
}
