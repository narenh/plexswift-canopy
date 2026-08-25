// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Gets a list of playlists and playlist folders for a user. General filters are permitted, such as
    /// `sort=lastViewedAt:desc`. A flat playlist list can be retrieved using `type=15` to limit the
    /// collection to just playlists.
    public struct ListPlaylists: PlexOperation {
        public typealias Success = MediaContainerWithPlaylistMetadata

        public static let operationID = "listPlaylists"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Whether this is a smart collection/playlist
        public var smart: Bool?

        /// Limit to a type of playlist
        public var playlistType: ListPlaylistsPlaylistType?

        /// Filter by playlist type. Use 42 for optimized/conversion items.
        public var type: Int?

        public init(
            smart: Bool? = nil,
            playlistType: ListPlaylistsPlaylistType? = nil,
            type: Int? = nil
        ) {
            self.smart = smart
            self.playlistType = playlistType
            self.type = type
        }

        public var path: String { "/playlists" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = smart {
                items.append(URLQueryItem(name: "smart", value: QueryValue(value).encoded))
            }
            if let value = playlistType {
                items.append(URLQueryItem(name: "playlistType", value: QueryValue(value).encoded))
            }
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
