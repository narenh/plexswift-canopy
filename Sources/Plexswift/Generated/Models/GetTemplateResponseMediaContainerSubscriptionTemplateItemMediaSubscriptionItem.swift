// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A media subscription contains a representation of metadata desired to be recorded
public struct GetTemplateResponseMediaContainerSubscriptionTemplateItemMediaSubscriptionItem: Codable, Hashable, Sendable {
    /// The title of this subscription type
    public let title: String?

    /// Metadata type number
    public let type: Int?

    public let airingsType: String?

    public let createdAt: Int?

    /// Media Matching Hints
    public let directory: AnyJSON?

    /// Only included if `includeStorage` is specified
    public let durationTotal: Int?

    public let key: String?

    public let librarySectionTitle: String?

    public let locationPath: String?

    public let mediaGrabOperation: [MediaGrabOperation]?

    /// Media Matching Hints
    public let playlist: AnyJSON?

    public let setting: [Setting]?

    /// Only included if `includeStorage` is specified
    public let storageTotal: Int?

    /// Where this subscription will record to
    public let targetLibrarySectionID: Int?

    /// The library section location id for where the item is to be recorded
    public let targetSectionLocationID: Int?

    /// Media Matching Hints
    public let video: AnyJSON?

    /// Parameter string for creating this subscription
    public let parameters: String?

    public let selected: Bool?

    public init(
        title: String? = nil,
        type: Int? = nil,
        airingsType: String? = nil,
        createdAt: Int? = nil,
        directory: AnyJSON? = nil,
        durationTotal: Int? = nil,
        key: String? = nil,
        librarySectionTitle: String? = nil,
        locationPath: String? = nil,
        mediaGrabOperation: [MediaGrabOperation]? = nil,
        playlist: AnyJSON? = nil,
        setting: [Setting]? = nil,
        storageTotal: Int? = nil,
        targetLibrarySectionID: Int? = nil,
        targetSectionLocationID: Int? = nil,
        video: AnyJSON? = nil,
        parameters: String? = nil,
        selected: Bool? = nil
    ) {
        self.title = title
        self.type = type
        self.airingsType = airingsType
        self.createdAt = createdAt
        self.directory = directory
        self.durationTotal = durationTotal
        self.key = key
        self.librarySectionTitle = librarySectionTitle
        self.locationPath = locationPath
        self.mediaGrabOperation = mediaGrabOperation
        self.playlist = playlist
        self.setting = setting
        self.storageTotal = storageTotal
        self.targetLibrarySectionID = targetLibrarySectionID
        self.targetSectionLocationID = targetSectionLocationID
        self.video = video
        self.parameters = parameters
        self.selected = selected
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case airingsType
        case createdAt
        case directory = "Directory"
        case durationTotal
        case key
        case librarySectionTitle
        case locationPath
        case mediaGrabOperation = "MediaGrabOperation"
        case playlist = "Playlist"
        case setting = "Setting"
        case storageTotal
        case targetLibrarySectionID
        case targetSectionLocationID
        case video = "Video"
        case parameters
        case selected
    }
}
