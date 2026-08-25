// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a bundle file for a metadata or media item. This is either an image or a mp3 (for a show's
    /// theme)
    public struct GetFile: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getFile"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The bundle url, typically starting with `metadata://` or `media://`
        public var url: String?

        public init(
            ids: String,
            url: String? = nil
        ) {
            self.ids = ids
            self.url = url
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/file" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = url {
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
