// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetTagsResponseMediaContainerDirectoryItem: Codable, Hashable, Sendable {
    /// The filter string to view metadata wit this tag
    public let filter: String?

    public let id: Int?

    /// The name of the tag
    public let tag: String?

    /// The key of this tag. This is a universal key across all PMS instances and plex.tv services
    public let tagKey: String?

    /// The type of the tag
    public let tagType: Int?

    /// The URL to a thumbnail for this tag
    public let thumb: String?

    public init(
        filter: String? = nil,
        id: Int? = nil,
        tag: String? = nil,
        tagKey: String? = nil,
        tagType: Int? = nil,
        thumb: String? = nil
    ) {
        self.filter = filter
        self.id = id
        self.tag = tag
        self.tagKey = tagKey
        self.tagType = tagType
        self.thumb = thumb
    }
}
