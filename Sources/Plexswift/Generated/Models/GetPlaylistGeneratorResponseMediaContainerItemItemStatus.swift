// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct GetPlaylistGeneratorResponseMediaContainerItemItemStatus: Codable, Hashable, Sendable {
    public let itemsCompleteCount: Int?

    public let itemsCount: Int?

    public let itemsSuccessfulCount: Int?

    public let state: GetPlaylistGeneratorResponseMediaContainerItemItemStatusState?

    public let totalSize: Int?

    public init(
        itemsCompleteCount: Int? = nil,
        itemsCount: Int? = nil,
        itemsSuccessfulCount: Int? = nil,
        state: GetPlaylistGeneratorResponseMediaContainerItemItemStatusState? = nil,
        totalSize: Int? = nil
    ) {
        self.itemsCompleteCount = itemsCompleteCount
        self.itemsCount = itemsCount
        self.itemsSuccessfulCount = itemsSuccessfulCount
        self.state = state
        self.totalSize = totalSize
    }
}
