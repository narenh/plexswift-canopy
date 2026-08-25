// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Lineup: Codable, Hashable, Sendable {
    public let title: String?

    /// The type of this object (`lineup` in this case)
    public let type: String?

    /// Lineup identifier.
    public let identifier: String?

    /// API key for this lineup.
    public let key: String?

    /// - `-1`: N/A
    /// - `0`: Over the air
    /// - `1`: Cable
    /// - `2`: Satellite
    /// - `3`: IPTV
    /// - `4`: Virtual
    public let lineupType: LineupLineupType?

    public let location: String?

    /// The uuid of this lineup
    public let uuid: String?

    public init(
        title: String? = nil,
        type: String? = nil,
        identifier: String? = nil,
        key: String? = nil,
        lineupType: LineupLineupType? = nil,
        location: String? = nil,
        uuid: String? = nil
    ) {
        self.title = title
        self.type = type
        self.identifier = identifier
        self.key = key
        self.lineupType = lineupType
        self.location = location
        self.uuid = uuid
    }
}
