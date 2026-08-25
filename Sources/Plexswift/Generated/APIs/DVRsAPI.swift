// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `DVRs` operations of the Plex API.
///
/// Reached through ``PlexClient/dvrs``.
public struct DVRsAPI: Sendable {
    let client: PlexClient

    /// Add a device to an existing DVR
    @discardableResult
    public func addDeviceToDVR(
        dvrId: Int,
        deviceId: Int
    ) async throws(PlexError) -> AddDeviceToDVRResponse {
        try await client.perform(Operations.AddDeviceToDVR(
            dvrId: dvrId,
            deviceId: deviceId
        ))
    }

    /// Add a lineup to a DVR device's set of lineups.
    @discardableResult
    public func addLineup(
        dvrId: Int,
        lineup: String
    ) async throws(PlexError) -> DVRResponse {
        try await client.perform(Operations.AddLineup(
            dvrId: dvrId,
            lineup: lineup
        ))
    }

    /// Creation of a DVR, after creation of a device and a lineup is selected
    @discardableResult
    public func createDVR(
        lineup: String? = nil,
        device: [String]? = nil,
        language: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.CreateDVR(
            lineup: lineup,
            device: device,
            language: language
        ))
    }

    /// Delete a single DVR by its id (key)
    @discardableResult
    public func deleteDVR(
        dvrId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.DeleteDVR(
            dvrId: dvrId
        ))
    }

    /// Deletes a DVR device's lineup.
    @discardableResult
    public func deleteLineup(
        dvrId: Int,
        lineup: String
    ) async throws(PlexError) -> DVRResponse {
        try await client.perform(Operations.DeleteLineup(
            dvrId: dvrId,
            lineup: lineup
        ))
    }

    /// Get a single DVR by its id (key)
    @discardableResult
    public func getDVR(
        dvrId: Int
    ) async throws(PlexError) -> DVRResponse {
        try await client.perform(Operations.GetDVR(
            dvrId: dvrId
        ))
    }

    /// List channels directly associated with a DVR.
    @discardableResult
    public func getDVRChannels(
        dvrId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetDVRChannels(
            dvrId: dvrId
        ))
    }

    /// Fetch program guide/schedule for a DVR.
    @discardableResult
    public func getDVRGuide(
        dvrId: Int
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetDVRGuide(
            dvrId: dvrId
        ))
    }

    /// Get the list of all available DVRs
    @discardableResult
    public func listDVRs(
        uuid: String? = nil,
        lineup: String? = nil
    ) async throws(PlexError) -> DVRResponse {
        try await client.perform(Operations.ListDVRs(
            uuid: uuid,
            lineup: lineup
        ))
    }

    /// Update DVR settings.
    @discardableResult
    public func patchDVRSettings(
        dvrId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.PatchDVRSettings(
            dvrId: dvrId
        ))
    }

    /// Tell a DVR to reload program guide
    @discardableResult
    public func reloadGuide(
        dvrId: Int
    ) async throws(PlexError) -> EmptyResponse {
        try await client.perform(Operations.ReloadGuide(
            dvrId: dvrId
        ))
    }

    /// Remove a device from an existing DVR
    @discardableResult
    public func removeDeviceFromDVR(
        dvrId: Int,
        deviceId: Int
    ) async throws(PlexError) -> RemoveDeviceFromDVRResponse {
        try await client.perform(Operations.RemoveDeviceFromDVR(
            dvrId: dvrId,
            deviceId: deviceId
        ))
    }

    /// Set DVR preferences by name and value
    @discardableResult
    public func setDVRPreferences(
        dvrId: Int,
        name: String? = nil,
        value: String? = nil
    ) async throws(PlexError) -> DVRResponse {
        try await client.perform(Operations.SetDVRPreferences(
            dvrId: dvrId,
            name: name,
            value: value
        ))
    }

    /// Tell a DVR to stop reloading program guide
    @discardableResult
    public func stopDVRReload(
        dvrId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.StopDVRReload(
            dvrId: dvrId
        ))
    }

    /// Tune a channel on a DVR to the provided channel
    @discardableResult
    public func tuneChannel(
        dvrId: Int,
        channel: String
    ) async throws(PlexError) -> MediaContainerWithMetadata {
        try await client.perform(Operations.TuneChannel(
            dvrId: dvrId,
            channel: channel
        ))
    }

    /// Update DVR settings.
    @discardableResult
    public func updateDVRSettings(
        dvrId: Int
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.UpdateDVRSettings(
            dvrId: dvrId
        ))
    }
}

extension PlexClient {
    /// The `DVRs` operations of the Plex API.
    public var dvrs: DVRsAPI { DVRsAPI(client: self) }
}
