// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Updater` operations of the Plex API.
///
/// Reached through ``PlexClient/updater``.
public struct UpdaterAPI: Sendable {
    let client: PlexClient

    /// Apply any downloaded updates. Note that the two parameters `tonight` and `skip` are effectively
    /// mutually exclusive. The `tonight` parameter takes precedence and `skip` will be ignored if
    /// `tonight` is also passed.
    @discardableResult
    public func applyUpdates(
        tonight: BoolInt? = nil,
        skip: BoolInt? = nil
    ) async throws -> EmptyResponse {
        try await client.perform(Operations.ApplyUpdates(
            tonight: tonight,
            skip: skip
        ))
    }

    /// Perform an update check and potentially download
    @discardableResult
    public func checkUpdates(
        download: BoolInt? = nil
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.CheckUpdates(
            download: download
        ))
    }

    /// Get the status of updating the server
    @discardableResult
    public func getUpdatesStatus() async throws -> GetUpdatesStatusResponse {
        try await client.perform(Operations.GetUpdatesStatus())
    }
}

extension PlexClient {
    /// The `Updater` operations of the Plex API.
    public var updater: UpdaterAPI { UpdaterAPI(client: self) }
}
