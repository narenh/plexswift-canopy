// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Status of the PMS updater.
public struct GetUpdatesStatusResponse: Codable, Hashable, Sendable {
    public let mediaContainer: GetUpdatesStatusResponseMediaContainer?

    /// Timestamp of the last update check.
    public let checkedAt: Int?

    /// The URL where the update is available.
    public let downloadURL: String?

    public let release: [Release]?

    /// The current error code (0 means no error).
    public let status: Int?

    public init(
        mediaContainer: GetUpdatesStatusResponseMediaContainer? = nil,
        checkedAt: Int? = nil,
        downloadURL: String? = nil,
        release: [Release]? = nil,
        status: Int? = nil
    ) {
        self.mediaContainer = mediaContainer
        self.checkedAt = checkedAt
        self.downloadURL = downloadURL
        self.release = release
        self.status = status
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
        case checkedAt
        case downloadURL
        case release = "Release"
        case status
    }
}
