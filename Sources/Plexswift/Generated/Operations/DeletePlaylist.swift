// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Deletes a playlist by provided id
    public struct DeletePlaylist: PlexOperation {
        public typealias Success = String

        public static let operationID = "deletePlaylist"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the playlist
        public var playlistId: Int

        public init(
            playlistId: Int
        ) {
            self.playlistId = playlistId
        }

        public var path: String { "/playlists/\(PathComponent(playlistId))" }
    }
}
