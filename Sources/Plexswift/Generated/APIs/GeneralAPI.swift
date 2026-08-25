// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `General` operations of the Plex API.
///
/// Reached through ``PlexClient/general``.
public struct GeneralAPI: Sendable {
    let client: PlexClient

    /// Add a webhook URL for the logged-in user.
    @discardableResult
    public func addUserWebhook() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.AddUserWebhook())
    }

    /// Add a webhook URL for the logged-in user.
    @discardableResult
    public func addWebhook() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.AddWebhook())
    }

    /// Browse filesystem paths accessible to the server.
    @discardableResult
    public func browseFilesystem(
        includeFiles: BoolInt? = nil
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.BrowseFilesystem(
            includeFiles: includeFiles
        ))
    }

    /// Browse a specific filesystem path.
    @discardableResult
    public func browseFilesystemPath(
        base64path: String
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.BrowseFilesystemPath(
            base64path: base64path
        ))
    }

    /// Check for available PMS updates.
    @discardableResult
    public func checkForSystemUpdates() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.CheckForSystemUpdates())
    }

    /// Claim the local PMS server using a claim token obtained from plex.tv.
    @discardableResult
    public func claimServer() async throws(PlexError) -> ClaimTokenResponse {
        try await client.perform(Operations.ClaimServer())
    }

    /// This endpoint provides the caller with a temporary token with the same access level as the
    /// caller's token. These tokens are valid for up to 48 hours and are destroyed if the server
    /// instance is restarted.
    /// Note: This endpoint responds to all HTTP verbs but POST in preferred
    @discardableResult
    public func createTransientToken(
        type: CreateTransientTokenType,
        scope: CreateTransientTokenScope
    ) async throws(PlexError) -> CreateTransientTokenResponse {
        try await client.perform(Operations.CreateTransientToken(
            type: type,
            scope: scope
        ))
    }

    /// Download server database diagnostics bundle.
    @discardableResult
    public func downloadDatabaseDiagnostics() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DownloadDatabaseDiagnostics())
    }

    /// Download server logs bundle.
    @discardableResult
    public func downloadLogBundle() async throws(PlexError) -> BinaryResponse {
        try await client.perform(Operations.DownloadLogBundle())
    }

    /// Get dashboard bandwidth data.
    @discardableResult
    public func getBandwidthStatistics(
        timespan: Int? = nil,
        accountID: Int? = nil,
        deviceID: Int? = nil,
        lan: BoolInt? = nil
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetBandwidthStatistics(
            timespan: timespan,
            accountID: accountID,
            deviceID: deviceID,
            lan: lan
        ))
    }

    /// Get a list of connected Plex clients.
    @discardableResult
    public func getClients() async throws(PlexError) -> GetClientsResponse {
        try await client.perform(Operations.GetClients())
    }

    /// Get Plex Cloud server status for the logged-in user.
    @discardableResult
    public func getCloudServer() async throws(PlexError) -> CloudServerResponse {
        try await client.perform(Operations.GetCloudServer())
    }

    /// Get server diagnostics overview.
    @discardableResult
    public func getDiagnostics() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetDiagnostics())
    }

    /// Get GeoIP lookup information for the current request.
    @discardableResult
    public func getGeoIP() async throws(PlexError) -> GeoIPResponse {
        try await client.perform(Operations.GetGeoIP())
    }

    /// Get the public IP address detected by Plex.
    @discardableResult
    public func getIP() async throws(PlexError) -> IPResponse {
        try await client.perform(Operations.GetIP())
    }

    /// Get details about this PMS's identity
    @discardableResult
    public func getIdentity() async throws(PlexError) -> GetIdentityResponse {
        try await client.perform(Operations.GetIdentity())
    }

    /// Get a list of local servers.
    @discardableResult
    public func getLocalServers() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetLocalServers())
    }

    /// Get details and settings for a specific metadata agent.
    @discardableResult
    public func getMetadataAgentDetails(
        agentId: String
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetMetadataAgentDetails(
            agentId: agentId
        ))
    }

    /// Get a list of available metadata agents.
    @discardableResult
    public func getMetadataAgents() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetMetadataAgents())
    }

    /// Get available Plex update downloads for a specific channel (e.g. `plexpass`, `public`).
    @discardableResult
    public func getPlexDownloads(
        channel: String
    ) async throws(PlexError) -> PlexDownloadsResponse {
        try await client.perform(Operations.GetPlexDownloads(
            channel: channel
        ))
    }

    /// Get dashboard resource data.
    @discardableResult
    public func getResourceStatistics() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetResourceStatistics())
    }

    /// Information about this PMS setup and configuration
    @discardableResult
    public func getServerInfo() async throws(PlexError) -> GetServerInfoResponse {
        try await client.perform(Operations.GetServerInfo())
    }

    /// If a caller requires connection details and a transient token for a source that is known to the
    /// server, for example a cloud media provider or shared PMS, then this endpoint can be called. This
    /// endpoint is only accessible with either an admin token or a valid transient token generated from
    /// an admin token.
    @discardableResult
    public func getSourceConnectionInformation(
        source: String,
        refresh: BoolInt? = nil
    ) async throws(PlexError) -> GetSourceConnectionInformationResponse {
        try await client.perform(Operations.GetSourceConnectionInformation(
            source: source,
            refresh: refresh
        ))
    }

    /// Get sync item details.
    @discardableResult
    public func getSyncItem(
        syncId: Int
    ) async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSyncItem(
            syncId: syncId
        ))
    }

    /// Get sync items list.
    @discardableResult
    public func getSyncItems() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSyncItems())
    }

    /// Get sync queue.
    @discardableResult
    public func getSyncQueue() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSyncQueue())
    }

    /// Get sync status overview.
    @discardableResult
    public func getSyncStatus() async throws(PlexError) -> MediaContainerWithStatus {
        try await client.perform(Operations.GetSyncStatus())
    }

    /// Get sync transcode queue status.
    @discardableResult
    public func getSyncTranscodeQueue() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSyncTranscodeQueue())
    }

    /// Get a list of local system accounts.
    @discardableResult
    public func getSystemAccounts() async throws(PlexError) -> MediaContainerWithDirectory {
        try await client.perform(Operations.GetSystemAccounts())
    }

    /// Get a list of local system devices.
    @discardableResult
    public func getSystemDevices() async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.GetSystemDevices())
    }

    /// Get system-level settings.
    @discardableResult
    public func getSystemSettings() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.GetSystemSettings())
    }

    /// List webhook URLs for the logged-in user.
    @discardableResult
    public func getUserWebhooks() async throws(PlexError) -> WebhookPayload {
        try await client.perform(Operations.GetUserWebhooks())
    }

    /// List configured webhook URLs for the logged-in user.
    @discardableResult
    public func getWebhooks() async throws(PlexError) -> WebhookPayload {
        try await client.perform(Operations.GetWebhooks())
    }

    /// Refresh remote access port mapping.
    @discardableResult
    public func refreshReachability() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RefreshReachability())
    }

    /// Force PMS to refresh content for known SyncLists.
    @discardableResult
    public func refreshSyncContent() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RefreshSyncContent())
    }

    /// Force PMS to download new SyncList from plex.tv.
    @discardableResult
    public func refreshSyncLists() async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.RefreshSyncLists())
    }
}

extension PlexClient {
    /// The `General` operations of the Plex API.
    public var general: GeneralAPI { GeneralAPI(client: self) }
}
