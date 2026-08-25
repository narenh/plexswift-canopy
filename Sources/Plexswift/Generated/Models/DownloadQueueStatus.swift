// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The state of this queue
/// - deciding: At least one item is still being decided
/// - waiting: At least one item is waiting for transcode and none are currently transcoding
/// - processing: At least one item is being transcoded
/// - done: All items are available (or potentially expired)
/// - error: At least one item has encountered an error
public enum DownloadQueueStatus: String, Codable, Hashable, Sendable, CaseIterable {
    case deciding = "deciding"
    case waiting = "waiting"
    case processing = "processing"
    case done = "done"
    case error = "error"
}
