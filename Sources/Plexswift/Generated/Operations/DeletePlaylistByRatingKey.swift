// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a playlist.
    public struct DeletePlaylistByRatingKey: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deletePlaylistByRatingKey"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The rating key of the playlist to delete.
        public var ratingKey: Int

        public init(
            ratingKey: Int
        ) {
            self.ratingKey = ratingKey
        }

        public var path: String { "/playlists" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = ratingKey
                items.append(URLQueryItem(name: "ratingKey", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
