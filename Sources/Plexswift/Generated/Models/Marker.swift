// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct Marker: Codable, Hashable, Sendable {
    public let title: String?

    public let type: MarkerType?

    public let color: String?

    public let endTimeOffset: Int?

    public let id: Int?

    public let startTimeOffset: Int?

    public init(
        title: String? = nil,
        type: MarkerType? = nil,
        color: String? = nil,
        endTimeOffset: Int? = nil,
        id: Int? = nil,
        startTimeOffset: Int? = nil
    ) {
        self.title = title
        self.type = type
        self.color = color
        self.endTimeOffset = endTimeOffset
        self.id = id
        self.startTimeOffset = startTimeOffset
    }
}
