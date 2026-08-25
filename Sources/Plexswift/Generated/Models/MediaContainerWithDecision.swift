// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// `MediaContainer` is commonly found as the root of a response and is a pretty generic container.
/// Common attributes include `identifier` and things related to paging (`offset`, `size`,
/// `totalSize`).
///
/// It is also common for a `MediaContainer` to contain attributes "hoisted" from its children. If
/// every element in the container would have had the same attribute, then that attribute can be
/// present on the container instead of being repeated on every element. For example, an album's
/// list of tracks might include `parentTitle` on the container since all of the tracks have the
/// same album title. A container may have a `source` attribute when all of the items came from the
/// same source. Generally speaking, when looking for an attribute on an item, if the attribute
/// wasn't found then the container should be checked for that attribute as well.
public struct MediaContainerWithDecision: Codable, Hashable, Sendable {
    /// `MediaContainer` is the root element of most Plex API responses. It serves as a generic
    /// container for various types of content (Metadata, Hubs, Directories, etc.) and includes
    /// pagination information (offset, size, totalSize) when applicable.
    /// Common attributes: - identifier: Unique identifier for this container - size: Number of items in
    /// this response page - totalSize: Total number of items available (for pagination) - offset:
    /// Starting index of this page (for pagination)
    /// The container often "hoists" common attributes from its children. For example, if all tracks in
    /// a container share the same album title, the `parentTitle` attribute may appear on the
    /// MediaContainer rather than being repeated on each track.
    public let mediaContainer: MediaContainerWithDecisionMediaContainer?

    public init(
        mediaContainer: MediaContainerWithDecisionMediaContainer? = nil
    ) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }
}
