// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct RemoveDeviceFromDVRResponse: Codable, Hashable, Sendable {
    public let mediaContainer: RemoveDeviceFromDVRResponseMediaContainer?

    public init(
        mediaContainer: RemoveDeviceFromDVRResponseMediaContainer? = nil
    ) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }
}
