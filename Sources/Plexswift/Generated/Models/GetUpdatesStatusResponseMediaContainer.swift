// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetUpdatesStatusResponseMediaContainer: Codable, Hashable, Sendable {
    /// The version of the updater (currently `1`)
    public let autoUpdateVersion: Int?

    /// Indicates whether this install can be updated through these endpoints (typically only on MacOS
    /// and Windows)
    public let canInstall: Bool?

    /// The last time a check for updates was performed
    public let checkedAt: Int?

    /// The URL where the update is available
    public let downloadURL: String?

    public let release: [Release]?

    /// The current error code (`0` means no error)
    public let status: Int?

    public init(
        autoUpdateVersion: Int? = nil,
        canInstall: Bool? = nil,
        checkedAt: Int? = nil,
        downloadURL: String? = nil,
        release: [Release]? = nil,
        status: Int? = nil
    ) {
        self.autoUpdateVersion = autoUpdateVersion
        self.canInstall = canInstall
        self.checkedAt = checkedAt
        self.downloadURL = downloadURL
        self.release = release
        self.status = status
    }

    private enum CodingKeys: String, CodingKey {
        case autoUpdateVersion
        case canInstall
        case checkedAt
        case downloadURL
        case release = "Release"
        case status
    }
}
