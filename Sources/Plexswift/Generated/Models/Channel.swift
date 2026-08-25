// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Channel: Codable, Hashable, Sendable {
    public let title: String?

    public let callSign: String?

    public let channelVcn: String?

    /// Whether the channel requires DRM.
    public let drm: Bool?

    /// Whether the channel is marked as a favorite.
    public let favorite: Bool?

    public let hd: Bool?

    public let identifier: String?

    public let key: String?

    public let language: String?

    /// Signal quality percentage (0-100).
    public let signalQuality: Int?

    /// Signal strength percentage (0-100).
    public let signalStrength: Int?

    public let thumb: String?

    public init(
        title: String? = nil,
        callSign: String? = nil,
        channelVcn: String? = nil,
        drm: Bool? = nil,
        favorite: Bool? = nil,
        hd: Bool? = nil,
        identifier: String? = nil,
        key: String? = nil,
        language: String? = nil,
        signalQuality: Int? = nil,
        signalStrength: Int? = nil,
        thumb: String? = nil
    ) {
        self.title = title
        self.callSign = callSign
        self.channelVcn = channelVcn
        self.drm = drm
        self.favorite = favorite
        self.hd = hd
        self.identifier = identifier
        self.key = key
        self.language = language
        self.signalQuality = signalQuality
        self.signalStrength = signalStrength
        self.thumb = thumb
    }
}
