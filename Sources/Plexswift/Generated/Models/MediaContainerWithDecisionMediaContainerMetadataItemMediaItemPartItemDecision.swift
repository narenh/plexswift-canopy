// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemDecision: String, Codable, Hashable, Sendable, CaseIterable {
    case directplay = "directplay"
    case transcode = "transcode"
    case `none` = "none"
}
