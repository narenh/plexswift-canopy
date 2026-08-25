// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Images such as movie posters and background artwork are represented by Image elements.
public struct Image: Codable, Hashable, Sendable {
    /// Describes both the purpose and intended presentation of the image.
    public let type: ImageType?

    /// Title to use for accessibility.
    public let alt: String?

    /// The relative path or absolute url for the image.
    public let url: String?

    public init(
        type: ImageType? = nil,
        alt: String? = nil,
        url: String? = nil
    ) {
        self.type = type
        self.alt = alt
        self.url = url
    }
}
