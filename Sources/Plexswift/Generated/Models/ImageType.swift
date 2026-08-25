// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Describes both the purpose and intended presentation of the image.
public enum ImageType: String, Codable, Hashable, Sendable, CaseIterable {
    case background = "background"
    case backgroundSquare = "backgroundSquare"
    case banner = "banner"
    case clearLogo = "clearLogo"
    case coverPoster = "coverPoster"
    case snapshot = "snapshot"
}
