// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum UpdateItemArtworkElement: String, Codable, Hashable, Sendable, CaseIterable {
    case thumb = "thumb"
    case art = "art"
    case clearLogo = "clearLogo"
    case banner = "banner"
    case poster = "poster"
    case theme = "theme"
}
