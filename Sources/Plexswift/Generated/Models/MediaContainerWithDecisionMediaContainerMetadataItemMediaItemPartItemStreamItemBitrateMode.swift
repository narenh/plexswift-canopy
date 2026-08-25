// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Audio bitrate mode (cbr or vbr).
public enum MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemBitrateMode: String, Codable, Hashable, Sendable, CaseIterable {
    case cbr = "cbr"
    case vbr = "vbr"
}
