// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get or update watch progress for a media item.
    public struct GetProgress: PlexOperation {
        public typealias Success = ProgressResponse

        public static let operationID = "getProgress"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The metadata key of the item
        public var key: String

        /// The current playback position in milliseconds
        public var time: Int

        public init(
            key: String,
            time: Int
        ) {
            self.key = key
            self.time = time
        }

        public var path: String { "/:/progress" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = key
                items.append(URLQueryItem(name: "key", value: QueryValue(value).encoded))
            }
            do {
                let value = time
                items.append(URLQueryItem(name: "time", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
