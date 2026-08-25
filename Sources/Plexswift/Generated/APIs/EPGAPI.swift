// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The `EPG` operations of the Plex API.
///
/// Reached through ``PlexClient/epg``.
public struct EPGAPI: Sendable {
    let client: PlexClient

    /// Compute the best channel map, given device and lineup
    @discardableResult
    public func computeChannelMap(
        device: String,
        lineup: String
    ) async throws -> ComputeChannelMapResponse {
        try await client.perform(Operations.ComputeChannelMap(
            device: device,
            lineup: lineup
        ))
    }

    /// Returns a list of all possible languages for EPG data.
    @discardableResult
    public func getAllLanguages() async throws -> GetAllLanguagesResponse {
        try await client.perform(Operations.GetAllLanguages())
    }

    /// Get channels for a lineup within an EPG provider
    @discardableResult
    public func getChannels(
        lineup: String
    ) async throws -> ChannelResponse {
        try await client.perform(Operations.GetChannels(
            lineup: lineup
        ))
    }

    /// This endpoint returns a list of countries which EPG data is available for. There are three
    /// flavors, as specfied by the `flavor` attribute
    @discardableResult
    public func getCountries() async throws -> GetCountriesResponse {
        try await client.perform(Operations.GetCountries())
    }

    /// Returns a list of lineups for a given country, EPG provider and postal code
    @discardableResult
    public func getCountriesLineups(
        country: String,
        epgId: String,
        postalCode: String? = nil
    ) async throws -> MediaContainerWithLineup {
        try await client.perform(Operations.GetCountriesLineups(
            country: country,
            epgId: epgId,
            postalCode: postalCode
        ))
    }

    /// Get regions for a country within an EPG provider
    @discardableResult
    public func getCountryRegions(
        country: String,
        epgId: String
    ) async throws -> GetCountryRegionsResponse {
        try await client.perform(Operations.GetCountryRegions(
            country: country,
            epgId: epgId
        ))
    }

    /// Fetch the global electronic program guide.
    @discardableResult
    public func getEPGGuide() async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.GetEPGGuide())
    }

    /// Compute the best lineup, given lineup group and device
    @discardableResult
    public func getLineup(
        device: String,
        lineupGroup: String
    ) async throws -> MediaContainerWithLineup {
        try await client.perform(Operations.GetLineup(
            device: device,
            lineupGroup: lineupGroup
        ))
    }

    /// Get the channels across multiple lineups
    @discardableResult
    public func getLineupChannels(
        lineup: [String]
    ) async throws -> GetLineupChannelsResponse {
        try await client.perform(Operations.GetLineupChannels(
            lineup: lineup
        ))
    }

    /// Get lineups for a region within an EPG provider
    @discardableResult
    public func listLineups(
        country: String,
        epgId: String,
        region: String
    ) async throws -> MediaContainerWithLineup {
        try await client.perform(Operations.ListLineups(
            country: country,
            epgId: epgId,
            region: region
        ))
    }

    /// Search the electronic program guide for upcoming airings.
    @discardableResult
    public func searchEPG() async throws -> MediaContainerWithMetadata {
        try await client.perform(Operations.SearchEPG())
    }
}

extension PlexClient {
    /// The `EPG` operations of the Plex API.
    public var epg: EPGAPI { EPGAPI(client: self) }
}
