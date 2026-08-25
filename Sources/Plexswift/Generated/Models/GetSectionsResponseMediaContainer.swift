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
public struct GetSectionsResponseMediaContainer: Codable, Hashable, Sendable {
    public let identifier: String?

    /// The offset of where this container page starts among the total objects available. Also provided
    /// in the `X-Plex-Container-Start` header.
    public let offset: Int?

    public let size: Int?

    /// The total size of objects available. Also provided in the `X-Plex-Container-Total-Size` header.
    public let totalSize: Int?

    public let allowSync: AllowSync?

    public let directory: [LibrarySection]?

    /// Typically just "Plex Library"
    public let title1: String?

    public init(
        identifier: String? = nil,
        offset: Int? = nil,
        size: Int? = nil,
        totalSize: Int? = nil,
        allowSync: AllowSync? = nil,
        directory: [LibrarySection]? = nil,
        title1: String? = nil
    ) {
        self.identifier = identifier
        self.offset = offset
        self.size = size
        self.totalSize = totalSize
        self.allowSync = allowSync
        self.directory = directory
        self.title1 = title1
    }

    private enum CodingKeys: String, CodingKey {
        case identifier
        case offset
        case size
        case totalSize
        case allowSync
        case directory = "Directory"
        case title1
    }
}
