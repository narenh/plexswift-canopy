// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Each `Filter` object contains a description of the filter. Note that it is not an exhaustive
/// list of the full media query language, but an important subset useful for top-level API.
public struct Filter: Codable, Hashable, Sendable {
    /// The title for the filter.
    public let title: String?

    public let type: String?

    public let art: String?

    public let content: Bool?

    /// This represents the filter name used for the filter, which can be used to construct complex
    /// media queries with.
    public let filter: String?

    public let hasPrefs: Bool?

    public let hasStoreServices: Bool?

    public let hubKey: String?

    public let identifier: String?

    /// This provides the endpoint where the possible range of values for the filter can be retrieved
    /// (e.g. for a "Genre" filter, it returns a list of all the genres in the library). This will
    /// include a `type` argument that matches the metadata type of the Type element.
    public let key: String?

    public let lastAccessedAt: Int?

    public let pivot: [FilterPivotItem]?

    public let share: Int?

    public let thumb: String?

    public let titleBar: String?

    /// This is either `string`, `integer`, or `boolean`, and describes the type of values used for the
    /// filter.
    public let filterType: String?

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
        pivot: [FilterPivotItem]? = nil,
        share: Int? = nil,
        thumb: String? = nil,
        titleBar: String? = nil,
        filterType: String? = nil
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
        self.filterType = filterType
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
        case filterType
    }
}
