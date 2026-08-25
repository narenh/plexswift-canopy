// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a playlist generator's items
    public struct GetPlaylistGeneratorItems: PlexOperation {
        public typealias Success = GetPlaylistGeneratorItemsResponse

        public static let operationID = "getPlaylistGeneratorItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the playlist
        public var playlistId: Int

        /// The generator item ID to delete.
        public var generatorId: Int

        public init(
            playlistId: Int,
            generatorId: Int
        ) {
            self.playlistId = playlistId
            self.generatorId = generatorId
        }

        public var path: String { "/playlists/\(PathComponent(playlistId))/items/\(PathComponent(generatorId))/items" }
    }
}
