// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetPlaylistGeneratorsResponseMediaContainerPlayQueueGeneratorItem: Codable, Hashable, Sendable {
    /// The type of playlist generator.
    ///
    /// - -1: A smart playlist generator
    /// - 42: A optimized version generator
    public let type: GetPlaylistGeneratorsResponseMediaContainerPlayQueueGeneratorItemType?

    public let changedAt: Int?

    public let createdAt: Int?

    public let id: Int?

    public let playlistID: Int?

    public let updatedAt: Int?

    /// The URI indicating the search for this generator
    public let uri: String?

    public init(
        type: GetPlaylistGeneratorsResponseMediaContainerPlayQueueGeneratorItemType? = nil,
        changedAt: Int? = nil,
        createdAt: Int? = nil,
        id: Int? = nil,
        playlistID: Int? = nil,
        updatedAt: Int? = nil,
        uri: String? = nil
    ) {
        self.type = type
        self.changedAt = changedAt
        self.createdAt = createdAt
        self.id = id
        self.playlistID = playlistID
        self.updatedAt = updatedAt
        self.uri = uri
    }
}
