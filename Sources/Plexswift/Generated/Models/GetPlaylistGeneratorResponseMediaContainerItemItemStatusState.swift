// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum GetPlaylistGeneratorResponseMediaContainerItemItemStatusState: String, Codable, Hashable, Sendable, CaseIterable {
    case pending = "pending"
    case complete = "complete"
    case failed = "failed"
}
