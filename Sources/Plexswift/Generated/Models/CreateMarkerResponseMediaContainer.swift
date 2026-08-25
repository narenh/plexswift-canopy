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
public struct CreateMarkerResponseMediaContainer: Codable, Hashable, Sendable {
    public let identifier: String?

    /// The offset of where this container page starts among the total objects available. Also provided
    /// in the `X-Plex-Container-Start` header.
    public let offset: Int?

    public let size: Int?

    /// The total size of objects available. Also provided in the `X-Plex-Container-Total-Size` header.
    public let totalSize: Int?

    public let title: String?

    public let type: CreateMarkerResponseMediaContainerType?

    public let color: String?

    public let endTimeOffset: Int?

    public let id: Int?

    public let startTimeOffset: Int?

    public init(
        identifier: String? = nil,
        offset: Int? = nil,
        size: Int? = nil,
        totalSize: Int? = nil,
        title: String? = nil,
        type: CreateMarkerResponseMediaContainerType? = nil,
        color: String? = nil,
        endTimeOffset: Int? = nil,
        id: Int? = nil,
        startTimeOffset: Int? = nil
    ) {
        self.identifier = identifier
        self.offset = offset
        self.size = size
        self.totalSize = totalSize
        self.title = title
        self.type = type
        self.color = color
        self.endTimeOffset = endTimeOffset
        self.id = id
        self.startTimeOffset = startTimeOffset
    }
}
