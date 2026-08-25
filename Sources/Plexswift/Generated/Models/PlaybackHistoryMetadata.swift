// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct PlaybackHistoryMetadata: Codable, Hashable, Sendable {
    /// The title of the item played
    public let title: String?

    /// The metadata type of the item played
    public let type: String?

    /// The account id of this playback
    public let accountID: Int?

    /// The device id which played the item
    public let deviceID: Int?

    /// The rating key of the grandparent item
    public let grandparentRatingKey: String?

    /// The title of the grandparent item (e.g. show name for an episode)
    public let grandparentTitle: String?

    /// The key for this individual history item
    public let historyKey: String?

    /// The index of the item (e.g. episode number)
    public let index: Int?

    /// The metadata key for the item played
    public let key: String?

    /// The library section id containing the item played
    public let librarySectionID: String?

    /// The originally available at of the item played
    public let originallyAvailableAt: String?

    /// The index of the parent item (e.g. season number)
    public let parentIndex: Int?

    /// The title of the parent item (e.g. season name for an episode)
    public let parentTitle: String?

    /// The rating key for the item played
    public let ratingKey: String?

    /// The thumb of the item played
    public let thumb: String?

    /// The time when the item was played
    public let viewedAt: Int?

    public init(
        title: String? = nil,
        type: String? = nil,
        accountID: Int? = nil,
        deviceID: Int? = nil,
        grandparentRatingKey: String? = nil,
        grandparentTitle: String? = nil,
        historyKey: String? = nil,
        index: Int? = nil,
        key: String? = nil,
        librarySectionID: String? = nil,
        originallyAvailableAt: String? = nil,
        parentIndex: Int? = nil,
        parentTitle: String? = nil,
        ratingKey: String? = nil,
        thumb: String? = nil,
        viewedAt: Int? = nil
    ) {
        self.title = title
        self.type = type
        self.accountID = accountID
        self.deviceID = deviceID
        self.grandparentRatingKey = grandparentRatingKey
        self.grandparentTitle = grandparentTitle
        self.historyKey = historyKey
        self.index = index
        self.key = key
        self.librarySectionID = librarySectionID
        self.originallyAvailableAt = originallyAvailableAt
        self.parentIndex = parentIndex
        self.parentTitle = parentTitle
        self.ratingKey = ratingKey
        self.thumb = thumb
        self.viewedAt = viewedAt
    }
}
