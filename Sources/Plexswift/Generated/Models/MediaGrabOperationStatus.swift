// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum MediaGrabOperationStatus: String, Codable, Hashable, Sendable, CaseIterable {
    case inactive = "inactive"
    case scheduled = "scheduled"
    case inprogress = "inprogress"
    case complete = "complete"
    case cancelled = "cancelled"
    case error = "error"
    case postprocessing = "postprocessing"
    case paused = "paused"
}
