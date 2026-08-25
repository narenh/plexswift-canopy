// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum MediaContainerWithDecisionMediaContainerMetadataItemMediaItemPartItemStreamItemDecision: String, Codable, Hashable, Sendable, CaseIterable {
    case copy = "copy"
    case transcode = "transcode"
    case burn = "burn"
    case unavailable = "unavailable"
    case ignore = "ignore"
    case `none` = "none"
}
