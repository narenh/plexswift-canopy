// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Each `Sort` object contains a description of the sort field.
public struct Sort: Codable, Hashable, Sendable {
    /// The title of the field.
    public let title: String?

    public let type: String?

    public let art: String?

    public let content: Bool?

    public let filter: String?

    public let hasPrefs: Bool?

    public let hasStoreServices: Bool?

    public let hubKey: String?

    public let identifier: String?

    /// The key to use in the sort field to make items sort by this item
    public let key: String?

    public let lastAccessedAt: Int?

    public let pivot: [SortPivotItem]?

    public let share: Int?

    public let thumb: String?

    public let titleBar: String?

    /// If present, this sort is the default and in this direction
    public let `default`: SortDefault?

    /// This default diction of this sort
    public let defaultDirection: SortDefaultDirection?

    /// The key for sorting this field in reverse order
    public let descKey: String?

    /// The key to use to get items sorted by this field and indexed by the first character
    public let firstCharacterKey: String?

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
        pivot: [SortPivotItem]? = nil,
        share: Int? = nil,
        thumb: String? = nil,
        titleBar: String? = nil,
        `default`: SortDefault? = nil,
        defaultDirection: SortDefaultDirection? = nil,
        descKey: String? = nil,
        firstCharacterKey: String? = nil
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
        self.`default` = `default`
        self.defaultDirection = defaultDirection
        self.descKey = descKey
        self.firstCharacterKey = firstCharacterKey
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
        case `default`
        case defaultDirection
        case descKey
        case firstCharacterKey
    }
}
