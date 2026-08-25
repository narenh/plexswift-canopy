// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ConnectionInfoWrapper: Codable, Hashable, Sendable {
    public let device: ConnectionInfo?

    public init(
        device: ConnectionInfo? = nil
    ) {
        self.device = device
    }

    private enum CodingKeys: String, CodingKey {
        case device = "Device"
    }
}
