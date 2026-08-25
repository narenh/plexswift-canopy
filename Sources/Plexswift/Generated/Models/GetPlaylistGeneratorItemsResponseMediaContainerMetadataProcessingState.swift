// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The state of processing if this generator is part of an optimizer playlist
public enum GetPlaylistGeneratorItemsResponseMediaContainerMetadataProcessingState: String, Codable, Hashable, Sendable, CaseIterable {
    case processed = "processed"
    case completed = "completed"
    case tombstoned = "tombstoned"
    case disabled = "disabled"
    case error = "error"
    case pending = "pending"
}
