// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ChannelMapping: Codable, Hashable, Sendable {
    public let channelKey: String?

    public let deviceIdentifier: String?

    public let enabled: String?

    public let lineupIdentifier: String?

    public init(
        channelKey: String? = nil,
        deviceIdentifier: String? = nil,
        enabled: String? = nil,
        lineupIdentifier: String? = nil
    ) {
        self.channelKey = channelKey
        self.deviceIdentifier = deviceIdentifier
        self.enabled = enabled
        self.lineupIdentifier = lineupIdentifier
    }
}
