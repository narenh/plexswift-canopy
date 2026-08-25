// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Modify a playlist generator. Only used for optimizer
    public struct ModifyPlaylistGenerator: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "modifyPlaylistGenerator"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the playlist
        public var playlistId: Int

        /// The generator item ID to modify.
        public var generatorId: Int

        /// Note: OpenAPI cannot properly render this query parameter example ([See
        /// GHI](https://github.com/OAI/OpenAPI-Specification/issues/1706)). It should be rendered as:
        ///
        /// Item[type]=42&Item[title]=Jack-Jack
        /// Attack&Item[target]=&Item[targetTagID]=1&Item[locationID]=-1&Item[Location][uri]=library://82503060-0d68-4603-b594-8b071d54819e/item//library/metadata/146&Item[Policy][scope]=all&Item[Policy][value]=&Item[Policy][unwatched]=0
        public var item: ModifyPlaylistGeneratorItem?

        public init(
            playlistId: Int,
            generatorId: Int,
            item: ModifyPlaylistGeneratorItem? = nil
        ) {
            self.playlistId = playlistId
            self.generatorId = generatorId
            self.item = item
        }

        public var path: String { "/playlists/\(PathComponent(playlistId))/items/\(PathComponent(generatorId))" }

        public var queryItems: [URLQueryItem] { get throws {
            var items: [URLQueryItem] = []
            if let value = item {
                items.append(contentsOf: try DeepObjectQuery.items(name: "Item", value: value))
            }
            return items
        } }
    }
}
