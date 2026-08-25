// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation
import XCTest
@testable import Plexswift

/// Decodes the example payload the specification publishes for each schema into the model
/// generated from that schema.
///
/// A failure here means the generated model and the specification disagree — a property typed
/// as `Int` that the example gives as a string, a field marked required that the example
/// omits, or an enum missing a case the API returns.
final class GeneratedModelDecodingTests: XCTestCase {

    /// Locates a fixture, tolerating either shape of resource bundle.
    ///
    /// SwiftPM's `.copy` rule preserves the directory, so the fixtures normally sit under a
    /// `Fixtures` subdirectory. Bundle layout differs between platforms, though, so the lookup
    /// falls back to the bundle root rather than failing on a layout difference alone.
    private func fixtureURL(_ name: String) -> URL? {
        Bundle.module.url(forResource: name, withExtension: "json", subdirectory: "Fixtures")
            ?? Bundle.module.url(forResource: name, withExtension: "json")
    }

    private func decodeFixture<T: Decodable>(_ name: String, as type: T.Type) throws -> T {
        let url = try XCTUnwrap(fixtureURL(name), "Missing fixture \(name).json")
        return try JSONDecoder().decode(type, from: try Data(contentsOf: url))
    }

    func testDecodesActivityExample() throws {
        XCTAssertNoThrow(try decodeFixture("Activity", as: Activity.self))
    }

    func testDecodesAddedQueueItemExample() throws {
        XCTAssertNoThrow(try decodeFixture("AddedQueueItem", as: AddedQueueItem.self))
    }

    func testDecodesAllowSyncExample() throws {
        XCTAssertNoThrow(try decodeFixture("AllowSync", as: AllowSync.self))
    }

    func testDecodesAuthKeysResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("AuthKeysResponse", as: AuthKeysResponse.self))
    }

    func testDecodesAuthNonceResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("AuthNonceResponse", as: AuthNonceResponse.self))
    }

    func testDecodesAuthTokenResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("AuthTokenResponse", as: AuthTokenResponse.self))
    }

    func testDecodesBadRequestErrorResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("BadRequestErrorResponse", as: BadRequestErrorResponse.self))
    }

    func testDecodesBandwidthExample() throws {
        XCTAssertNoThrow(try decodeFixture("Bandwidth", as: Bandwidth.self))
    }

    func testDecodesBoolIntExample() throws {
        XCTAssertNoThrow(try decodeFixture("BoolInt", as: BoolInt.self))
    }

    func testDecodesButlerTaskExample() throws {
        XCTAssertNoThrow(try decodeFixture("ButlerTask", as: ButlerTask.self))
    }

    func testDecodesChannelExample() throws {
        XCTAssertNoThrow(try decodeFixture("Channel", as: Channel.self))
    }

    func testDecodesChannelMappingExample() throws {
        XCTAssertNoThrow(try decodeFixture("ChannelMapping", as: ChannelMapping.self))
    }

    func testDecodesChannelResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("ChannelResponse", as: ChannelResponse.self))
    }

    func testDecodesClaimTokenResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("ClaimTokenResponse", as: ClaimTokenResponse.self))
    }

    func testDecodesCloudServerResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("CloudServerResponse", as: CloudServerResponse.self))
    }

    func testDecodesCollectionValueExample() throws {
        XCTAssertNoThrow(try decodeFixture("CollectionValue", as: CollectionValue.self))
    }

    func testDecodesConnectionExample() throws {
        XCTAssertNoThrow(try decodeFixture("Connection", as: Connection.self))
    }

    func testDecodesConnectionInfoExample() throws {
        XCTAssertNoThrow(try decodeFixture("ConnectionInfo", as: ConnectionInfo.self))
    }

    func testDecodesConnectionInfoWrapperExample() throws {
        XCTAssertNoThrow(try decodeFixture("ConnectionInfoWrapper", as: ConnectionInfoWrapper.self))
    }

    func testDecodesDVRExample() throws {
        XCTAssertNoThrow(try decodeFixture("DVR", as: DVR.self))
    }

    func testDecodesDVRResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("DVRResponse", as: DVRResponse.self))
    }

    func testDecodesDecisionResultExample() throws {
        XCTAssertNoThrow(try decodeFixture("DecisionResult", as: DecisionResult.self))
    }

    func testDecodesDeviceExample() throws {
        XCTAssertNoThrow(try decodeFixture("Device", as: Device.self))
    }

    func testDecodesDeviceChannelExample() throws {
        XCTAssertNoThrow(try decodeFixture("DeviceChannel", as: DeviceChannel.self))
    }

    func testDecodesDirectoryExample() throws {
        XCTAssertNoThrow(try decodeFixture("Directory", as: Directory.self))
    }

    func testDecodesDownloadQueueExample() throws {
        XCTAssertNoThrow(try decodeFixture("DownloadQueue", as: DownloadQueue.self))
    }

    func testDecodesDownloadQueueItemExample() throws {
        XCTAssertNoThrow(try decodeFixture("DownloadQueueItem", as: DownloadQueueItem.self))
    }

    func testDecodesEPGCountryExample() throws {
        XCTAssertNoThrow(try decodeFixture("EPGCountry", as: EPGCountry.self))
    }

    func testDecodesEPGLanguageExample() throws {
        XCTAssertNoThrow(try decodeFixture("EPGLanguage", as: EPGLanguage.self))
    }

    func testDecodesEPGRegionExample() throws {
        XCTAssertNoThrow(try decodeFixture("EPGRegion", as: EPGRegion.self))
    }

    func testDecodesErrorValueExample() throws {
        XCTAssertNoThrow(try decodeFixture("ErrorValue", as: ErrorValue.self))
    }

    func testDecodesFeatureExample() throws {
        XCTAssertNoThrow(try decodeFixture("Feature", as: Feature.self))
    }

    func testDecodesFilterExample() throws {
        XCTAssertNoThrow(try decodeFixture("Filter", as: Filter.self))
    }

    func testDecodesGeoIPResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("GeoIPResponse", as: GeoIPResponse.self))
    }

    func testDecodesHubExample() throws {
        XCTAssertNoThrow(try decodeFixture("Hub", as: Hub.self))
    }

    func testDecodesIPResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("IPResponse", as: IPResponse.self))
    }

    func testDecodesImageExample() throws {
        XCTAssertNoThrow(try decodeFixture("Image", as: Image.self))
    }

    func testDecodesItemsExample() throws {
        XCTAssertNoThrow(try decodeFixture("Items", as: Items.self))
    }

    func testDecodesJWKRegistrationRequestExample() throws {
        XCTAssertNoThrow(try decodeFixture("JWKRegistrationRequest", as: JWKRegistrationRequest.self))
    }

    func testDecodesKeyExample() throws {
        XCTAssertNoThrow(try decodeFixture("Key", as: Key.self))
    }

    func testDecodesLegacyPinResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("LegacyPinResponse", as: LegacyPinResponse.self))
    }

    func testDecodesLevelExample() throws {
        XCTAssertNoThrow(try decodeFixture("Level", as: Level.self))
    }

    func testDecodesLibrarySectionExample() throws {
        XCTAssertNoThrow(try decodeFixture("LibrarySection", as: LibrarySection.self))
    }

    func testDecodesLineupExample() throws {
        XCTAssertNoThrow(try decodeFixture("Lineup", as: Lineup.self))
    }

    func testDecodesLogMessageRequestExample() throws {
        XCTAssertNoThrow(try decodeFixture("LogMessageRequest", as: LogMessageRequest.self))
    }

    func testDecodesManagedHubExample() throws {
        XCTAssertNoThrow(try decodeFixture("ManagedHub", as: ManagedHub.self))
    }

    func testDecodesMarkerExample() throws {
        XCTAssertNoThrow(try decodeFixture("Marker", as: Marker.self))
    }

    func testDecodesMediaExample() throws {
        XCTAssertNoThrow(try decodeFixture("Media", as: Media.self))
    }

    func testDecodesMediaContainerExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainer", as: MediaContainer.self))
    }

    func testDecodesMediaContainerWithArtworkExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithArtwork", as: MediaContainerWithArtwork.self))
    }

    func testDecodesMediaContainerWithDecisionExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithDecision", as: MediaContainerWithDecision.self))
    }

    func testDecodesMediaContainerWithDeviceExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithDevice", as: MediaContainerWithDevice.self))
    }

    func testDecodesMediaContainerWithDirectoryExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithDirectory", as: MediaContainerWithDirectory.self))
    }

    func testDecodesMediaContainerWithHubsExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithHubs", as: MediaContainerWithHubs.self))
    }

    func testDecodesMediaContainerWithLineupExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithLineup", as: MediaContainerWithLineup.self))
    }

    func testDecodesMediaContainerWithMediaGrabOperationExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithMediaGrabOperation", as: MediaContainerWithMediaGrabOperation.self))
    }

    func testDecodesMediaContainerWithMetadataExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithMetadata", as: MediaContainerWithMetadata.self))
    }

    func testDecodesMediaContainerWithNestedMetadataExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithNestedMetadata", as: MediaContainerWithNestedMetadata.self))
    }

    func testDecodesMediaContainerWithPlayQueueExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithPlayQueue", as: MediaContainerWithPlayQueue.self))
    }

    func testDecodesMediaContainerWithPlaylistMetadataExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithPlaylistMetadata", as: MediaContainerWithPlaylistMetadata.self))
    }

    func testDecodesMediaContainerWithSettingsExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithSettings", as: MediaContainerWithSettings.self))
    }

    func testDecodesMediaContainerWithSortsExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithSorts", as: MediaContainerWithSorts.self))
    }

    func testDecodesMediaContainerWithStatusExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithStatus", as: MediaContainerWithStatus.self))
    }

    func testDecodesMediaContainerWithSubscriptionExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithSubscription", as: MediaContainerWithSubscription.self))
    }

    func testDecodesMediaContainerWithTagsExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaContainerWithTags", as: MediaContainerWithTags.self))
    }

    func testDecodesMediaGrabOperationExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaGrabOperation", as: MediaGrabOperation.self))
    }

    func testDecodesMediaGrabberExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaGrabber", as: MediaGrabber.self))
    }

    func testDecodesMediaQueryExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaQuery", as: MediaQuery.self))
    }

    func testDecodesMediaSubscriptionExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaSubscription", as: MediaSubscription.self))
    }

    func testDecodesMediaTypeExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaType", as: MediaType.self))
    }

    func testDecodesMediaTypeStringExample() throws {
        XCTAssertNoThrow(try decodeFixture("MediaTypeString", as: MediaTypeString.self))
    }

    func testDecodesMetadataExample() throws {
        XCTAssertNoThrow(try decodeFixture("Metadata", as: Metadata.self))
    }

    func testDecodesNotificationContainerExample() throws {
        XCTAssertNoThrow(try decodeFixture("NotificationContainer", as: NotificationContainer.self))
    }

    func testDecodesPartExample() throws {
        XCTAssertNoThrow(try decodeFixture("Part", as: Part.self))
    }

    func testDecodesPlayQueueResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("PlayQueueResponse", as: PlayQueueResponse.self))
    }

    func testDecodesPlaySessionStateNotificationExample() throws {
        XCTAssertNoThrow(try decodeFixture("PlaySessionStateNotification", as: PlaySessionStateNotification.self))
    }

    func testDecodesPlaybackHistoryMetadataExample() throws {
        XCTAssertNoThrow(try decodeFixture("PlaybackHistoryMetadata", as: PlaybackHistoryMetadata.self))
    }

    func testDecodesPlayerExample() throws {
        XCTAssertNoThrow(try decodeFixture("Player", as: Player.self))
    }

    func testDecodesPlexDateTimeExample() throws {
        XCTAssertNoThrow(try decodeFixture("PlexDateTime", as: PlexDateTime.self))
    }

    func testDecodesPlexDateTimeISOExample() throws {
        XCTAssertNoThrow(try decodeFixture("PlexDateTimeISO", as: PlexDateTimeISO.self))
    }

    func testDecodesPlexDeviceExample() throws {
        XCTAssertNoThrow(try decodeFixture("PlexDevice", as: PlexDevice.self))
    }

    func testDecodesPlexDownloadsResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("PlexDownloadsResponse", as: PlexDownloadsResponse.self))
    }

    func testDecodesProgressResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("ProgressResponse", as: ProgressResponse.self))
    }

    func testDecodesProviderExample() throws {
        XCTAssertNoThrow(try decodeFixture("Provider", as: Provider.self))
    }

    func testDecodesProviderFeatureExample() throws {
        XCTAssertNoThrow(try decodeFixture("ProviderFeature", as: ProviderFeature.self))
    }

    func testDecodesReachabilityNotificationExample() throws {
        XCTAssertNoThrow(try decodeFixture("ReachabilityNotification", as: ReachabilityNotification.self))
    }

    func testDecodesReleaseExample() throws {
        XCTAssertNoThrow(try decodeFixture("Release", as: Release.self))
    }

    func testDecodesServerAccessTokensResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("ServerAccessTokensResponse", as: ServerAccessTokensResponse.self))
    }

    func testDecodesServerConfigurationExample() throws {
        XCTAssertNoThrow(try decodeFixture("ServerConfiguration", as: ServerConfiguration.self))
    }

    func testDecodesServerUserFeaturesResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("ServerUserFeaturesResponse", as: ServerUserFeaturesResponse.self))
    }

    func testDecodesSessionExample() throws {
        XCTAssertNoThrow(try decodeFixture("Session", as: Session.self))
    }

    func testDecodesSettingExample() throws {
        XCTAssertNoThrow(try decodeFixture("Setting", as: Setting.self))
    }

    func testDecodesSortExample() throws {
        XCTAssertNoThrow(try decodeFixture("Sort", as: Sort.self))
    }

    func testDecodesStatusNotificationExample() throws {
        XCTAssertNoThrow(try decodeFixture("StatusNotification", as: StatusNotification.self))
    }

    func testDecodesStreamExample() throws {
        XCTAssertNoThrow(try decodeFixture("Stream", as: Stream.self))
    }

    func testDecodesSuccessResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("SuccessResponse", as: SuccessResponse.self))
    }

    func testDecodesTagExample() throws {
        XCTAssertNoThrow(try decodeFixture("Tag", as: Tag.self))
    }

    func testDecodesThumbExample() throws {
        XCTAssertNoThrow(try decodeFixture("Thumb", as: Thumb.self))
    }

    func testDecodesTimelineEntryExample() throws {
        XCTAssertNoThrow(try decodeFixture("TimelineEntry", as: TimelineEntry.self))
    }

    func testDecodesTokenExchangeRequestExample() throws {
        XCTAssertNoThrow(try decodeFixture("TokenExchangeRequest", as: TokenExchangeRequest.self))
    }

    func testDecodesTopUserAccountExample() throws {
        XCTAssertNoThrow(try decodeFixture("TopUserAccount", as: TopUserAccount.self))
    }

    func testDecodesTranscodeJobExample() throws {
        XCTAssertNoThrow(try decodeFixture("TranscodeJob", as: TranscodeJob.self))
    }

    func testDecodesTranscodeSessionExample() throws {
        XCTAssertNoThrow(try decodeFixture("TranscodeSession", as: TranscodeSession.self))
    }

    func testDecodesUltraBlurColorsExample() throws {
        XCTAssertNoThrow(try decodeFixture("UltraBlurColors", as: UltraBlurColors.self))
    }

    func testDecodesUnauthorizedErrorResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("UnauthorizedErrorResponse", as: UnauthorizedErrorResponse.self))
    }

    func testDecodesUpdaterStatusExample() throws {
        XCTAssertNoThrow(try decodeFixture("UpdaterStatus", as: UpdaterStatus.self))
    }

    func testDecodesUserExample() throws {
        XCTAssertNoThrow(try decodeFixture("User", as: User.self))
    }

    func testDecodesUserOptOutsResponseExample() throws {
        XCTAssertNoThrow(try decodeFixture("UserOptOutsResponse", as: UserOptOutsResponse.self))
    }

    func testDecodesUserPlexAccountExample() throws {
        XCTAssertNoThrow(try decodeFixture("UserPlexAccount", as: UserPlexAccount.self))
    }

    func testDecodesUserProfileExample() throws {
        XCTAssertNoThrow(try decodeFixture("UserProfile", as: UserProfile.self))
    }

    func testDecodesWebhookPayloadExample() throws {
        XCTAssertNoThrow(try decodeFixture("WebhookPayload", as: WebhookPayload.self))
    }
}
