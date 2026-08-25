// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// `MediaContainer` is the root element of most Plex API responses. It serves as a generic
/// container for various types of content (Metadata, Hubs, Directories, etc.) and includes
/// pagination information (offset, size, totalSize) when applicable.
/// Common attributes: - identifier: Unique identifier for this container - size: Number of items in
/// this response page - totalSize: Total number of items available (for pagination) - offset:
/// Starting index of this page (for pagination)
/// The container often "hoists" common attributes from its children. For example, if all tracks in
/// a container share the same album title, the `parentTitle` attribute may appear on the
/// MediaContainer rather than being repeated on each track.
public struct GetPlaylistGeneratorItemsResponseMediaContainer: Codable, Hashable, Sendable {
    public let identifier: String?

    /// The offset of where this container page starts among the total objects available. Also provided
    /// in the `X-Plex-Container-Start` header.
    public let offset: Int?

    public let size: Int?

    /// The total size of objects available. Also provided in the `X-Plex-Container-Total-Size` header.
    public let totalSize: Int?

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
    public let metadata: GetPlaylistGeneratorItemsResponseMediaContainerMetadata?

    public init(
        identifier: String? = nil,
        offset: Int? = nil,
        size: Int? = nil,
        totalSize: Int? = nil,
        metadata: GetPlaylistGeneratorItemsResponseMediaContainerMetadata? = nil
    ) {
        self.identifier = identifier
        self.offset = offset
        self.size = size
        self.totalSize = totalSize
        self.metadata = metadata
    }

    private enum CodingKeys: String, CodingKey {
        case identifier
        case offset
        case size
        case totalSize
        case metadata = "Metadata"
    }
}
