// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Directory: Codable, Hashable, Sendable {
    public let title: String?

    public let type: String?

    public let art: String?

    public let content: Bool?

    public let filter: String?

    public let hasPrefs: Bool?

    public let hasStoreServices: Bool?

    public let hubKey: String?

    public let identifier: String?

    public let key: String?

    public let lastAccessedAt: Int?

    public let pivot: [DirectoryPivotItem]?

    public let share: Int?

    public let thumb: String?

    public let titleBar: String?

    public init(
        title: String? = nil,
        type: String? = nil,
        art: String? = nil,
        content: Bool? = nil,
        filter: String? = nil,
        hasPrefs: Bool? = nil,
        hasStoreServices: Bool? = nil,
        hubKey: String? = nil,
        identifier: String? = nil,
        key: String? = nil,
        lastAccessedAt: Int? = nil,
        pivot: [DirectoryPivotItem]? = nil,
        share: Int? = nil,
        thumb: String? = nil,
        titleBar: String? = nil
    ) {
        self.title = title
        self.type = type
        self.art = art
        self.content = content
        self.filter = filter
        self.hasPrefs = hasPrefs
        self.hasStoreServices = hasStoreServices
        self.hubKey = hubKey
        self.identifier = identifier
        self.key = key
        self.lastAccessedAt = lastAccessedAt
        self.pivot = pivot
        self.share = share
        self.thumb = thumb
        self.titleBar = titleBar
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case art
        case content
        case filter
        case hasPrefs
        case hasStoreServices
        case hubKey
        case identifier
        case key
        case lastAccessedAt
        case pivot = "Pivot"
        case share
        case thumb
        case titleBar
    }
}
