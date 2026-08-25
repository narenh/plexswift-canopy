// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// A MediaContainer that includes metadata items. When `includeCollections=1` is passed to
/// endpoints such as `/library/sections/{sectionId}/all`, this container may also include
/// `Collection` items.
public struct MediaContainerWithMetadata: Codable, Hashable, Sendable {
    /// `MediaContainer` is the root element of most Plex API responses. It serves as a generic
    /// container for various types of content (Metadata, Hubs, Directories, etc.) and includes
    /// pagination information (offset, size, totalSize) when applicable.
    /// Common attributes: - identifier: Unique identifier for this container - size: Number of items in
    /// this response page - totalSize: Total number of items available (for pagination) - offset:
    /// Starting index of this page (for pagination)
    /// The container often "hoists" common attributes from its children. For example, if all tracks in
    /// a container share the same album title, the `parentTitle` attribute may appear on the
    /// MediaContainer rather than being repeated on each track.
    public let mediaContainer: MediaContainerWithMetadataMediaContainer?

    public init(
        mediaContainer: MediaContainerWithMetadataMediaContainer? = nil
    ) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }
}
