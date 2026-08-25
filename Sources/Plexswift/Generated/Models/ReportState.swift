// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum ReportState: String, Codable, Hashable, Sendable, CaseIterable {
    case stopped = "stopped"
    case buffering = "buffering"
    case playing = "playing"
    case paused = "paused"
}
