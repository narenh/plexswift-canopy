// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Create a new playlist. By default the playlist is blank.
    public struct CreatePlaylist: PlexOperation {
        public typealias Success = MediaContainerWithPlaylistMetadata

        public static let operationID = "createPlaylist"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The content URI for what we're playing (e.g. `library://...`).
        public var uri: String?

        /// To create a playlist from an existing play queue.
        public var playQueueID: Int?

        public init(
            uri: String? = nil,
            playQueueID: Int? = nil
        ) {
            self.uri = uri
            self.playQueueID = playQueueID
        }

        public var path: String { "/playlists" }

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
