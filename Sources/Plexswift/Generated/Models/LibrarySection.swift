// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct LibrarySection: Codable, Hashable, Sendable {
    /// The title of the library
    public let title: String?

    /// The type of media content in the Plex library. This can represent videos, music, or photos.
    public let type: MediaTypeString?

    public let agent: String?

    public let allowSync: LibrarySectionAllowSync?

    public let art: String?

    public let composite: String?

    public let content: Bool?

    /// Unix epoch datetime in seconds
    public let contentChangedAt: PlexDateTime?

    /// Unix epoch datetime in seconds
    public let createdAt: PlexDateTime?

    public let directory: Bool?

    /// Indicates whether this section has filtering capabilities
    public let filters: Bool?

    public let hidden: Bool?

    public let key: Key?

    public let language: String?

    public let location: [LibrarySectionLocationItem]?

    /// Indicates whether this library section is currently scanning
    public let refreshing: Bool?

    /// Unix epoch datetime in seconds
    public let scannedAt: PlexDateTime?

    public let scanner: String?

    public let thumb: Thumb?

    /// Unix epoch datetime in seconds
    public let updatedAt: PlexDateTime?

    /// The universally unique identifier for the library.
    public let uuid: String?

    public init(
        title: String? = nil,
        type: MediaTypeString? = nil,
        agent: String? = nil,
        allowSync: LibrarySectionAllowSync? = nil,
        art: String? = nil,
        composite: String? = nil,
        content: Bool? = nil,
        contentChangedAt: PlexDateTime? = nil,
        createdAt: PlexDateTime? = nil,
        directory: Bool? = nil,
        filters: Bool? = nil,
        hidden: Bool? = nil,
        key: Key? = nil,
        language: String? = nil,
        location: [LibrarySectionLocationItem]? = nil,
        refreshing: Bool? = nil,
        scannedAt: PlexDateTime? = nil,
        scanner: String? = nil,
        thumb: Thumb? = nil,
        updatedAt: PlexDateTime? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.type = type
        self.agent = agent
        self.allowSync = allowSync
        self.art = art
        self.composite = composite
        self.content = content
        self.contentChangedAt = contentChangedAt
        self.createdAt = createdAt
        self.directory = directory
        self.filters = filters
        self.hidden = hidden
        self.key = key
        self.language = language
        self.location = location
        self.refreshing = refreshing
        self.scannedAt = scannedAt
        self.scanner = scanner
        self.thumb = thumb
        self.updatedAt = updatedAt
        self.uuid = uuid
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case agent
        case allowSync
        case art
        case composite
        case content
        case contentChangedAt
        case createdAt
        case directory
        case filters
        case hidden
        case key
        case language
        case location = "Location"
        case refreshing
        case scannedAt
        case scanner
        case thumb
        case updatedAt
        case uuid
    }
}
