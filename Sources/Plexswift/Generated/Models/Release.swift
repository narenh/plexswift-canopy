// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Release: Codable, Hashable, Sendable {
    /// A list of what has been added in this version
    public let added: String?

    /// The URL of where this update is available
    public let downloadURL: String?

    /// A list of what has been fixed in this version
    public let fixed: String?

    /// The URL key of the update
    public let key: String?

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
    public let state: ReleaseState?

    /// The version available
    public let version: String?

    public init(
        added: String? = nil,
        downloadURL: String? = nil,
        fixed: String? = nil,
        key: String? = nil,
        state: ReleaseState? = nil,
        version: String? = nil
    ) {
        self.added = added
        self.downloadURL = downloadURL
        self.fixed = fixed
        self.key = key
        self.state = state
        self.version = version
    }
}
