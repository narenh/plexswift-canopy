// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A variety of extra information about a metadata item is included as tags. These tags use their
/// own element names such as `Genre`, `Writer`, `Directory`, and `Role`. Individual tag types may
/// introduce their own extra attributes.
public struct Tag: Codable, Hashable, Sendable {
    /// Measure of the confidence of an automatic tag
    public let confidence: Double?

    public let context: String?

    /// A filter parameter that can be used to query for more content that matches this tag value.
    public let filter: String?

    public let id: Int?

    /// The rating key (Media ID) of this media item. Note: Although this is always an integer, it is
    /// represented as a string in the API.
    public let ratingKey: String?

    /// The role this actor played
    public let role: String?

    /// The value of the tag (the name)
    public let tag: String?

    /// Plex identifier for this tag which can be used to fetch additional information from plex.tv
    public let tagKey: String?

    public let tagType: Int?

    public let thumb: String?

    public init(
        confidence: Double? = nil,
        context: String? = nil,
        filter: String? = nil,
        id: Int? = nil,
        ratingKey: String? = nil,
        role: String? = nil,
        tag: String? = nil,
        tagKey: String? = nil,
        tagType: Int? = nil,
        thumb: String? = nil
    ) {
        self.confidence = confidence
        self.context = context
        self.filter = filter
        self.id = id
        self.ratingKey = ratingKey
        self.role = role
        self.tag = tag
        self.tagKey = tagKey
        self.tagType = tagType
        self.thumb = thumb
    }
}
