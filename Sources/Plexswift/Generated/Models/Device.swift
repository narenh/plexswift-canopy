// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Device: Codable, Hashable, Sendable {
    /// Display title for the device.
    public let title: String?

    public let channelMapping: [ChannelMapping]?

    /// Distinct hardware identifier for the device.
    public let deviceIdentifier: String?

    /// Whether the device is enabled.
    public let enabled: Bool?

    /// Unique device ID.
    public let id: Int?

    public let key: String?

    public let lastSeenAt: Int?

    /// EPG lineup association.
    public let lineup: String?

    /// Type of EPG lineup.
    public let lineupType: String?

    public let make: String?

    public let model: String?

    public let modelNumber: String?

    /// Human-readable device name.
    public let name: String?

    public let `protocol`: String?

    public let sources: String?

    public let state: String?

    public let status: String?

    /// URL to the device thumbnail image.
    public let thumb: String?

    /// Version of the device thumbnail.
    public let thumbVersion: Int?

    public let tuners: String?

    public let uri: String?

    public let uuid: String?

    public init(
        title: String? = nil,
        channelMapping: [ChannelMapping]? = nil,
        deviceIdentifier: String? = nil,
        enabled: Bool? = nil,
        id: Int? = nil,
        key: String? = nil,
        lastSeenAt: Int? = nil,
        lineup: String? = nil,
        lineupType: String? = nil,
        make: String? = nil,
        model: String? = nil,
        modelNumber: String? = nil,
        name: String? = nil,
        `protocol`: String? = nil,
        sources: String? = nil,
        state: String? = nil,
        status: String? = nil,
        thumb: String? = nil,
        thumbVersion: Int? = nil,
        tuners: String? = nil,
        uri: String? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.channelMapping = channelMapping
        self.deviceIdentifier = deviceIdentifier
        self.enabled = enabled
        self.id = id
        self.key = key
        self.lastSeenAt = lastSeenAt
        self.lineup = lineup
        self.lineupType = lineupType
        self.make = make
        self.model = model
        self.modelNumber = modelNumber
        self.name = name
        self.`protocol` = `protocol`
        self.sources = sources
        self.state = state
        self.status = status
        self.thumb = thumb
        self.thumbVersion = thumbVersion
        self.tuners = tuners
        self.uri = uri
        self.uuid = uuid
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case channelMapping = "ChannelMapping"
        case deviceIdentifier
        case enabled
        case id
        case key
        case lastSeenAt
        case lineup
        case lineupType
        case make
        case model
        case modelNumber
        case name
        case `protocol`
        case sources
        case state
        case status
        case thumb
        case thumbVersion
        case tuners
        case uri
        case uuid
    }
}
