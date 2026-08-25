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
public struct MediaContainerWithDecisionMediaContainer: Codable, Hashable, Sendable {
    public let identifier: String?

    /// The offset of where this container page starts among the total objects available. Also provided
    /// in the `X-Plex-Container-Start` header.
    public let offset: Int?

    public let size: Int?

    /// The total size of objects available. Also provided in the `X-Plex-Container-Total-Size` header.
    public let totalSize: Int?

    /// The maximum available bitrate when the decision was rendered.
    public let availableBandwidth: Int?

    public let directPlayDecisionCode: Int?

    public let directPlayDecisionText: String?

    /// The overall decision. 1xxx are playback can succeed, 2xxx are a general error (such as
    /// insufficient bandwidth), 3xxx are errors in direct play, and 4xxx are errors in transcodes. Same
    /// codes are used in all.
    public let generalDecisionCode: Int?

    public let generalDecisionText: String?

    /// The code indicating the status of evaluation of playback when client indicates `hasMDE=1`
    public let mdeDecisionCode: Int?

    /// Descriptive text for the above code
    public let mdeDecisionText: String?

    public let metadata: [MediaContainerWithDecisionMediaContainerMetadataItem]?

    public let transcodeDecisionCode: Int?

    public let transcodeDecisionText: String?

    public init(
        identifier: String? = nil,
        offset: Int? = nil,
        size: Int? = nil,
        totalSize: Int? = nil,
        availableBandwidth: Int? = nil,
        directPlayDecisionCode: Int? = nil,
        directPlayDecisionText: String? = nil,
        generalDecisionCode: Int? = nil,
        generalDecisionText: String? = nil,
        mdeDecisionCode: Int? = nil,
        mdeDecisionText: String? = nil,
        metadata: [MediaContainerWithDecisionMediaContainerMetadataItem]? = nil,
        transcodeDecisionCode: Int? = nil,
        transcodeDecisionText: String? = nil
    ) {
        self.identifier = identifier
        self.offset = offset
        self.size = size
        self.totalSize = totalSize
        self.availableBandwidth = availableBandwidth
        self.directPlayDecisionCode = directPlayDecisionCode
        self.directPlayDecisionText = directPlayDecisionText
        self.generalDecisionCode = generalDecisionCode
        self.generalDecisionText = generalDecisionText
        self.mdeDecisionCode = mdeDecisionCode
        self.mdeDecisionText = mdeDecisionText
        self.metadata = metadata
        self.transcodeDecisionCode = transcodeDecisionCode
        self.transcodeDecisionText = transcodeDecisionText
    }

    private enum CodingKeys: String, CodingKey {
        case identifier
        case offset
        case size
        case totalSize
        case availableBandwidth
        case directPlayDecisionCode
        case directPlayDecisionText
        case generalDecisionCode
        case generalDecisionText
        case mdeDecisionCode
        case mdeDecisionText
        case metadata = "Metadata"
        case transcodeDecisionCode
        case transcodeDecisionText
    }
}
