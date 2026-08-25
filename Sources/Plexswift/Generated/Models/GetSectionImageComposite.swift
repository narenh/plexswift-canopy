// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetSectionImageComposite: Codable, Hashable, Sendable {
    /// Limit composite to specified metadata types
    public let type: Int?

    /// The image type
    public let format: GetSectionImageCompositeFormat?

    /// 6 character hex RGB value for background color for image
    public let backgroundColor: String?

    /// The width of the intra-image border
    public let border: Int?

    /// Number of columns to construct in the composite image
    public let cols: Int?

    /// Where to crop source images to fit into composite image proportions
    public let crop: GetSectionImageCompositeCrop?

    /// The height of the image
    public let height: Int?

    /// The default image type to use as the sources
    public let media: GetSectionImageCompositeMedia?

    /// Allow repetion of images if there are not enough source images to fill grid
    public let `repeat`: Bool?

    /// Number of rows to construct in the composite image
    public let rows: Int?

    /// The width of the image
    public let width: Int?

    public init(
        type: Int? = nil,
        format: GetSectionImageCompositeFormat? = nil,
        backgroundColor: String? = nil,
        border: Int? = nil,
        cols: Int? = nil,
        crop: GetSectionImageCompositeCrop? = nil,
        height: Int? = nil,
        media: GetSectionImageCompositeMedia? = nil,
        repeat: Bool? = nil,
        rows: Int? = nil,
        width: Int? = nil
    ) {
        self.type = type
        self.format = format
        self.backgroundColor = backgroundColor
        self.border = border
        self.cols = cols
        self.crop = crop
        self.height = height
        self.media = media
        self.`repeat` = `repeat`
        self.rows = rows
        self.width = width
    }
}
