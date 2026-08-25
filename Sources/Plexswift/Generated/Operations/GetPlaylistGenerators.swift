// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get all the generators in a playlist
    public struct GetPlaylistGenerators: PlexOperation {
        public typealias Success = GetPlaylistGeneratorsResponse

        public static let operationID = "getPlaylistGenerators"
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

        public var path: String { "/playlists/\(PathComponent(playlistId))/generators" }
    }
}
