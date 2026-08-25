// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Gets detailed metadata for a playlist. A playlist for many purposes (rating, editing metadata,
    /// tagging), can be treated like a regular metadata item:
    /// Smart playlist details contain the `content` attribute. This is the content URI for the
    /// generator. This can then be parsed by a client to provide smart playlist editing.
    public struct GetPlaylist: PlexOperation {
        public typealias Success = MediaContainerWithPlaylistMetadata

        public static let operationID = "getPlaylist"
        public static let method = HTTPMethod.get
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
