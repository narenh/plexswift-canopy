// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Edits a playlist in the same manner as [editing
    /// metadata](#tag/Provider/operation/metadataPutItem)
    public struct UpdatePlaylist: PlexOperation {
        public typealias Success = String

        public static let operationID = "updatePlaylist"
        public static let method = HTTPMethod.put
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
