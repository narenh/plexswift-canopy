// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Make a generator reprocess (refresh)
    public struct RefreshPlaylist: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "refreshPlaylist"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the playlist
        public var playlistId: Int

        /// The generator item ID to act on
        public var generatorId: Int

        /// The metadata item ID to act on
        public var metadataId: Int

        /// The action to perform for this item on this optimizer queue
        public var action: RefreshPlaylistAction

        public init(
            playlistId: Int,
            generatorId: Int,
            metadataId: Int,
            action: RefreshPlaylistAction
        ) {
            self.playlistId = playlistId
            self.generatorId = generatorId
            self.metadataId = metadataId
            self.action = action
        }

        public var path: String { "/playlists/\(PathComponent(playlistId))/items/\(PathComponent(generatorId))/\(PathComponent(metadataId))/\(PathComponent(action))" }
    }
}
