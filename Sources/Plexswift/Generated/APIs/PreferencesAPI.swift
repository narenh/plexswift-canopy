// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Preferences` operations of the Plex API.
///
/// Reached through ``PlexClient/preferences``.
public struct PreferencesAPI: Sendable {
    let client: PlexClient

    /// Get the list of all preferences
    @discardableResult
    public func getAllPreferences() async throws -> MediaContainerWithSettings {
        try await client.perform(Operations.GetAllPreferences())
    }

    /// Get a single preference and value
    @discardableResult
    public func getPreference(
        id: String? = nil
    ) async throws -> MediaContainerWithSettings {
        try await client.perform(Operations.GetPreference(
            id: id
        ))
    }

    /// Set a set of preferences in query parameters
    @discardableResult
    public func setPreferences(
        prefs: AnyJSON
    ) async throws -> SuccessResponse {
        try await client.perform(Operations.SetPreferences(
            prefs: prefs
        ))
    }
}

extension PlexClient {
    /// The `Preferences` operations of the Plex API.
    public var preferences: PreferencesAPI { PreferencesAPI(client: self) }
}
