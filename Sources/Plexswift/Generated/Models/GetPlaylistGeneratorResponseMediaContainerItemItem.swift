// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetPlaylistGeneratorResponseMediaContainerItemItem: Codable, Hashable, Sendable {
    public let title: String?

    /// The type of this generator
    public let type: GetPlaylistGeneratorResponseMediaContainerItemItemType?

    /// The composite thumbnail image path
    public let composite: String?

    public let device: GetPlaylistGeneratorResponseMediaContainerItemItemDevice?

    public let id: Int?

    public let location: GetPlaylistGeneratorResponseMediaContainerItemItemLocation?

    public let mediaSettings: GetPlaylistGeneratorResponseMediaContainerItemItemMediaSettings?

    public let policy: GetPlaylistGeneratorResponseMediaContainerItemItemPolicy?

    public let status: GetPlaylistGeneratorResponseMediaContainerItemItemStatus?

    public let target: String?

    /// The tag of this generator's settings
    public let targetTagID: Int?

    public init(
        title: String? = nil,
        type: GetPlaylistGeneratorResponseMediaContainerItemItemType? = nil,
        composite: String? = nil,
        device: GetPlaylistGeneratorResponseMediaContainerItemItemDevice? = nil,
        id: Int? = nil,
        location: GetPlaylistGeneratorResponseMediaContainerItemItemLocation? = nil,
        mediaSettings: GetPlaylistGeneratorResponseMediaContainerItemItemMediaSettings? = nil,
        policy: GetPlaylistGeneratorResponseMediaContainerItemItemPolicy? = nil,
        status: GetPlaylistGeneratorResponseMediaContainerItemItemStatus? = nil,
        target: String? = nil,
        targetTagID: Int? = nil
    ) {
        self.title = title
        self.type = type
        self.composite = composite
        self.device = device
        self.id = id
        self.location = location
        self.mediaSettings = mediaSettings
        self.policy = policy
        self.status = status
        self.target = target
        self.targetTagID = targetTagID
    }

    private enum CodingKeys: String, CodingKey {
        case title
        case type
        case composite
        case device = "Device"
        case id
        case location = "Location"
        case mediaSettings = "MediaSettings"
        case policy = "Policy"
        case status = "Status"
        case target
        case targetTagID
    }
}
