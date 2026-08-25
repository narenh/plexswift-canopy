// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ComputeChannelMapResponseMediaContainerChannelMappingItem: Codable, Hashable, Sendable {
    public let channelKey: String?

    /// The channel description on the device
    public let deviceIdentifier: String?

    public let favorite: Bool?

    /// The channel identifier in the lineup
    public let lineupIdentifier: String?

    public init(
        channelKey: String? = nil,
        deviceIdentifier: String? = nil,
        favorite: Bool? = nil,
        lineupIdentifier: String? = nil
    ) {
        self.channelKey = channelKey
        self.deviceIdentifier = deviceIdentifier
        self.favorite = favorite
        self.lineupIdentifier = lineupIdentifier
    }
}
