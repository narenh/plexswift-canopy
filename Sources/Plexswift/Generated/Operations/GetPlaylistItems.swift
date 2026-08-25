// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Gets the contents of a playlist. Should be paged by clients via standard mechanisms. By default
    /// leaves are returned (e.g. episodes, movies). In order to return other types you can use the
    /// `type` parameter. For example, you could use this to display a list of recently added albums vis
    /// a smart playlist. Note that for dumb playlists, items have a `playlistItemID` attribute which is
    /// used for deleting or moving items.
    public struct GetPlaylistItems: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getPlaylistItems"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the playlist
        public var playlistId: Int

        /// The metadata types of the item to return. Values past the first are only used in fetching items
        /// from the background processing playlist.
        public var type: [Int]?

        public init(
            playlistId: Int,
            type: [Int]? = nil
        ) {
            self.playlistId = playlistId
            self.type = type
        }

        public var path: String { "/playlists/\(PathComponent(playlistId))/items" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = type {
                items.append(URLQueryItem(name: "type", value: value.map { QueryValue($0).encoded }.joined(separator: ",")))
            }
            return items
        }
    }
}
