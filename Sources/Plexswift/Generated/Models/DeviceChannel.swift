// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct DeviceChannel: Codable, Hashable, Sendable {
    /// Indicates the channel is DRMed and thus may not be playable
    public let drm: Bool?

    public let favorite: Bool?

    public let hd: Bool?

    public let identifier: String?

    public let key: String?

    public let name: String?

    public let signalQuality: Int?

    public let signalStrength: Int?

    public init(
        drm: Bool? = nil,
        favorite: Bool? = nil,
        hd: Bool? = nil,
        identifier: String? = nil,
        key: String? = nil,
        name: String? = nil,
        signalQuality: Int? = nil,
        signalStrength: Int? = nil
    ) {
        self.drm = drm
        self.favorite = favorite
        self.hd = hd
        self.identifier = identifier
        self.key = key
        self.name = name
        self.signalQuality = signalQuality
        self.signalStrength = signalStrength
    }
}
