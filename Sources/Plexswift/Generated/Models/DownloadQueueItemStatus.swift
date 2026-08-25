// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The state of the item:
/// - deciding: The item decision is pending
/// - waiting: The item is waiting for transcode
/// - processing: The item is being transcoded
/// - available: The item is available for download
/// - error: The item encountered an error in the decision or transcode
/// - expired: The transcoded item has timed out and is no longer available
public enum DownloadQueueItemStatus: String, Codable, Hashable, Sendable, CaseIterable {
    case deciding = "deciding"
    case waiting = "waiting"
    case processing = "processing"
    case available = "available"
    case error = "error"
    case expired = "expired"
}
