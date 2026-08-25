// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Adds a generator to a playlist, same parameters as the POST above. With a dumb playlist, this
    /// adds the specified items to the playlist. With a smart playlist, passing a new `uri` parameter
    /// replaces the rules for the playlist. Returns the playlist.
    public struct AddPlaylistItems: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "addPlaylistItems"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the playlist
        public var playlistId: Int

        /// The content URI for the playlist.
        public var uri: String?

        /// The play queue to add to a playlist.
        public var playQueueID: Int?

        public init(
            playlistId: Int,
            uri: String? = nil,
            playQueueID: Int? = nil
        ) {
            self.playlistId = playlistId
            self.uri = uri
            self.playQueueID = playQueueID
        }

        public var path: String { "/playlists/\(PathComponent(playlistId))/items" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = uri {
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            if let value = playQueueID {
                items.append(URLQueryItem(name: "playQueueID", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
