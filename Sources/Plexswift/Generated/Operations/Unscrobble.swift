// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Mark an item as unplayed. The client must provide either the `key` or `uri` query parameter
    /// This API does respond to the GET verb but applications should use PUT
    public struct Unscrobble: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "unscrobble"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The identifier of the media provider containing the media to rate. Typically
        /// `com.plexapp.plugins.library`
        public var identifier: String

        /// The key of the item to rate. This is the `ratingKey` found in metadata items
        public var key: String?

        /// URI of the item to scrobble. Format is `library://<section-uuid>/item/<url-encoded-key>` or
        /// `plex://movie/<guid>` or `plex://episode/<guid>`.
        public var uri: String

        public init(
            identifier: String,
            key: String? = nil,
            uri: String
        ) {
            self.identifier = identifier
            self.key = key
            self.uri = uri
        }

        public var path: String { "/:/unscrobble" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = identifier
                items.append(URLQueryItem(name: "identifier", value: QueryValue(value).encoded))
            }
            if let value = key {
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
            }
            do {
                let value = uri
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
