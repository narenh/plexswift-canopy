// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetLibraryDetailsResponseMediaContainer: Codable, Hashable, Sendable {
    public let allowSync: GetLibraryDetailsResponseMediaContainerAllowSync?

    public let art: String?

    /// The flavors of directory found here:
    /// - Primary: (e.g. all, On Deck) These are still used in some clients to provide "shortcuts" to subsets of media. However, with the exception of On Deck, all of them can be created by media queries, and the desire is to allow these to be customized by users.
    /// - Secondary: These are marked with `"secondary": true` and were used by old clients to provide nested menus allowing for primative (but structured) navigation.
    /// - Special: There is a By Folder entry which allows browsing the media by the underlying filesystem structure, and there's a completely obsolete entry marked `"search": true` which used to be used to allow clients to build search dialogs on the fly.
    public let content: String?

    public let directory: [Metadata]?

    public let identifier: String?

    public let librarySectionID: Int?

    public let mediaTagPrefix: String?

    public let mediaTagVersion: Int?

    public let size: Int?

    public let sortAsc: Bool?

    public let thumb: String?

    public let title1: String?

    public let viewGroup: String?

    public let viewMode: Int?

    public init(
        allowSync: GetLibraryDetailsResponseMediaContainerAllowSync? = nil,
        art: String? = nil,
        content: String? = nil,
        directory: [Metadata]? = nil,
        identifier: String? = nil,
        librarySectionID: Int? = nil,
        mediaTagPrefix: String? = nil,
        mediaTagVersion: Int? = nil,
        size: Int? = nil,
        sortAsc: Bool? = nil,
        thumb: String? = nil,
        title1: String? = nil,
        viewGroup: String? = nil,
        viewMode: Int? = nil
    ) {
        self.allowSync = allowSync
        self.art = art
        self.content = content
        self.directory = directory
        self.identifier = identifier
        self.librarySectionID = librarySectionID
        self.mediaTagPrefix = mediaTagPrefix
        self.mediaTagVersion = mediaTagVersion
        self.size = size
        self.sortAsc = sortAsc
        self.thumb = thumb
        self.title1 = title1
        self.viewGroup = viewGroup
        self.viewMode = viewMode
    }

    private enum CodingKeys: String, CodingKey {
        case allowSync
        case art
        case content
        case directory = "Directory"
        case identifier
        case librarySectionID
        case mediaTagPrefix
        case mediaTagVersion
        case size
        case sortAsc
        case thumb
        case title1
        case viewGroup
        case viewMode
    }
}
