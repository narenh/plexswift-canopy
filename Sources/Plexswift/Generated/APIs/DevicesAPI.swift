// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `Devices` operations of the Plex API.
///
/// Reached through ``PlexClient/devices``.
public struct DevicesAPI: Sendable {
    let client: PlexClient

    /// This endpoint adds a device to an existing grabber. The device is identified, and added to the
    /// correct grabber.
    @discardableResult
    public func addDevice(
        uri: String? = nil
    ) async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.AddDevice(
            uri: uri
        ))
    }

    /// Tell grabbers to discover devices
    @discardableResult
    public func discoverDevices(
        protocol: DiscoverDevicesProtocol? = nil,
        grabberIdentifier: String? = nil
    ) async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.DiscoverDevices(
            protocol: `protocol`,
            grabberIdentifier: grabberIdentifier
        ))
    }

    /// Get available grabbers visible to the server
    @discardableResult
    public func getAvailableGrabbers(
        protocol: String? = nil
    ) async throws(PlexError) -> GetAvailableGrabbersResponse {
        try await client.perform(Operations.GetAvailableGrabbers(
            protocol: `protocol`
        ))
    }

    /// Get a device's details by its id
    @discardableResult
    public func getDeviceDetails(
        deviceId: Int
    ) async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.GetDeviceDetails(
            deviceId: deviceId
        ))
    }

    /// Get a device's channels by its id
    @discardableResult
    public func getDevicesChannels(
        deviceId: Int
    ) async throws(PlexError) -> GetDevicesChannelsResponse {
        try await client.perform(Operations.GetDevicesChannels(
            deviceId: deviceId
        ))
    }

    /// Get a device's thumb for display to the user
    @discardableResult
    public func getThumb(
        deviceId: Int,
        version: Int
    ) async throws(PlexError) -> Data {
        try await client.perform(Operations.GetThumb(
            deviceId: deviceId,
            version: version
        ))
    }

    /// Get the list of all devices present
    @discardableResult
    public func listDevices() async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.ListDevices())
    }

    /// Enable or disable a device by its id
    @discardableResult
    public func modifyDevice(
        deviceId: Int,
        enabled: BoolInt? = nil
    ) async throws(PlexError) -> ModifyDeviceResponse {
        try await client.perform(Operations.ModifyDevice(
            deviceId: deviceId,
            enabled: enabled
        ))
    }

    /// Remove a devices by its id along with its channel mappings
    @discardableResult
    public func removeDevice(
        deviceId: Int
    ) async throws(PlexError) -> RemoveDeviceResponse {
        try await client.perform(Operations.RemoveDevice(
            deviceId: deviceId
        ))
    }

    /// Tell a device to scan for channels
    @discardableResult
    public func scan(
        deviceId: Int,
        source: String? = nil
    ) async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.Scan(
            deviceId: deviceId,
            source: source
        ))
    }

    /// Set a device's channel mapping
    @discardableResult
    public func setChannelmap(
        deviceId: Int,
        channelMapping: AnyJSON? = nil,
        channelMappingByKey: AnyJSON? = nil,
        channelsEnabled: [String]? = nil
    ) async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.SetChannelmap(
            deviceId: deviceId,
            channelMapping: channelMapping,
            channelMappingByKey: channelMappingByKey,
            channelsEnabled: channelsEnabled
        ))
    }

    /// Set device preferences by its id
    @discardableResult
    public func setDevicePreferences(
        deviceId: Int,
        name: String? = nil,
        value: String? = nil
    ) async throws(PlexError) -> SuccessResponse {
        try await client.perform(Operations.SetDevicePreferences(
            deviceId: deviceId,
            name: name,
            value: value
        ))
    }

    /// Tell a device to stop scanning for channels
    @discardableResult
    public func stopScan(
        deviceId: Int
    ) async throws(PlexError) -> MediaContainerWithDevice {
        try await client.perform(Operations.StopScan(
            deviceId: deviceId
        ))
    }
}

extension PlexClient {
    /// The `Devices` operations of the Plex API.
    public var devices: DevicesAPI { DevicesAPI(client: self) }
}
