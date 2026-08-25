// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The status of this update.
///
/// - available - This release is available
/// - downloading - This release is downloading
/// - downloaded - This release has been downloaded
/// - installing - This release is installing
/// - tonight - This release will be installed tonight
/// - skipped - This release has been skipped
/// - error - This release has an error
/// - notify - This release is only notifying it is available (typically because it cannot be installed on this setup)
/// - done - This release is complete
public enum ReleaseState: String, Codable, Hashable, Sendable, CaseIterable {
    case available = "available"
    case downloading = "downloading"
    case downloaded = "downloaded"
    case installing = "installing"
    case tonight = "tonight"
    case skipped = "skipped"
    case error = "error"
    case notify = "notify"
    case done = "done"
}
