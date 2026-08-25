// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A media grab operation represents a scheduled or active recording of media
public struct MediaGrabOperation: Codable, Hashable, Sendable {
    public let currentSize: Int?

    public let grabberIdentifier: String?

    public let grabberProtocol: String?

    public let id: String?

    public let key: String?

    public let mediaIndex: Int?

    public let mediaSubscriptionID: Int?

    /// Items in a library are referred to as "metadata items." These metadata items are distinct from
    /// "media items" which represent actual instances of media that can be consumed. Consider a TV
    /// library that has a single video file in it for a particular episode of a show. The library has a
    /// single media item, but it has three metadata items: one for the show, one for the season, and
    /// one for the episode. Consider a movie library that has two video files in it: the same movie,
    /// but two different resolutions. The library has a single metadata item for the movie, but that
    /// metadata item has two media items, one for each resolution. Additionally a "media item" will
    /// have one or more "media parts" where the the parts are intended to be watched together, such as
    /// a CD1 and CD2 parts of the same movie.
    ///
    /// Note that when a metadata item has multiple media items, those media items should be isomorphic.
    /// That is, a 4K version and 1080p version of a movie are different versions of the same movie.
    /// They have the same duration, same summary, same rating, etc. and they can generally be
    /// considered interchangeable. A theatrical release vs. director's cut vs. unrated version on the
    /// other hand would be separate metadata items.
    ///
    /// Metadata items can often live in a hierarchy with relationships between them. For example, the
    /// metadata item for an episodes is associated with a season metadata item which is associated with
    /// a show metadata item. A similar hierarchy exists with track, album, and artist and photos and
    /// photo album. The relationships may be expressed via relative terms and absolute terms. For
    /// example, "leaves" refer to metadata items which has associated media (there is no media for a
    /// season nor show). A show will have "children" in the form of seasons and a season will have
    /// "children" in the form of episodes and episodes have "parent" in the form of a season which has
    /// a "parent" in the form of a show. Similarly, a show has "grandchildren" in the form of episodse
    /// and an episode has a "grandparent" in the form of a show.
    public let metadata: Metadata?

    public let percent: Double?

    public let provider: String?

    public let status: MediaGrabOperationStatus?

    public init(
        currentSize: Int? = nil,
        grabberIdentifier: String? = nil,
        grabberProtocol: String? = nil,
        id: String? = nil,
        key: String? = nil,
        mediaIndex: Int? = nil,
        mediaSubscriptionID: Int? = nil,
        metadata: Metadata? = nil,
        percent: Double? = nil,
        provider: String? = nil,
        status: MediaGrabOperationStatus? = nil
    ) {
        self.currentSize = currentSize
        self.grabberIdentifier = grabberIdentifier
        self.grabberProtocol = grabberProtocol
        self.id = id
        self.key = key
        self.mediaIndex = mediaIndex
        self.mediaSubscriptionID = mediaSubscriptionID
        self.metadata = metadata
        self.percent = percent
        self.provider = provider
        self.status = status
    }

    private enum CodingKeys: String, CodingKey {
        case currentSize
        case grabberIdentifier
        case grabberProtocol
        case id
        case key
        case mediaIndex
        case mediaSubscriptionID
        case metadata = "Metadata"
        case percent
        case provider
        case status
    }
}
