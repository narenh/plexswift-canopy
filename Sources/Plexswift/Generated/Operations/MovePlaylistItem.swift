// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Moves an item in a playlist. Only works with dumb playlists.
    public struct MovePlaylistItem: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "movePlaylistItem"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the playlist
        public var playlistId: Int

        /// The playlist item ID to move.
        public var playlistItemId: Int

        /// The playlist item ID to insert the new item after. If not provided, item is moved to beginning
        /// of playlist
        public var after: Int?

        public init(
            playlistId: Int,
            playlistItemId: Int,
            after: Int? = nil
        ) {
            self.playlistId = playlistId
            self.playlistItemId = playlistItemId
            self.after = after
        }

        public var path: String { "/playlists/\(PathComponent(playlistId))/items/\(PathComponent(playlistItemId))/move" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = after {
                items.append(URLQueryItem(name: "after", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
