// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum AddDownloadQueueItemsSubtitles: String, Codable, Hashable, Sendable, CaseIterable {
    case auto = "auto"
    case burn = "burn"
    case `none` = "none"
    case sidecar = "sidecar"
    case embedded = "embedded"
    case segmented = "segmented"
    case unknown = "unknown"
}
