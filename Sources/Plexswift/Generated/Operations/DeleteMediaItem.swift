// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a single media from a metadata item in the library
    public struct DeleteMediaItem: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteMediaItem"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The mediaItem
        public var mediaItem: String

        /// Whether proxy items, such as media optimized versions, should also be deleted. Defaults to
        /// false.
        public var proxy: BoolInt?

        public init(
            ids: String,
            mediaItem: String,
            proxy: BoolInt? = nil
        ) {
            self.ids = ids
            self.mediaItem = mediaItem
            self.proxy = proxy
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/media/\(PathComponent(mediaItem))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = proxy {
                items.append(URLQueryItem(name: "proxy", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
