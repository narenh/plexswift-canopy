// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct AddDeviceToDVRResponse: Codable, Hashable, Sendable {
    public let mediaContainer: AddDeviceToDVRResponseMediaContainer?

    public init(
        mediaContainer: AddDeviceToDVRResponseMediaContainer? = nil
    ) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }
}
