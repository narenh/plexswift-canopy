// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set a stream offset in ms. This may not be respected by all clients
    public struct SetStreamOffset: PlexOperation {
        public typealias Success = Data

        public static let operationID = "setStreamOffset"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the stream
        public var streamId: Int

        /// This is not a part of this endpoint but documented here to satisfy OpenAPI
        public var ext: String

        /// The offest in ms
        public var offset: Int?

        public init(
            streamId: Int,
            ext: String,
            offset: Int? = nil
        ) {
            self.streamId = streamId
            self.ext = ext
            self.offset = offset
        }

        public var path: String { "/library/streams/\(PathComponent(streamId)).\(PathComponent(ext))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = offset {
                items.append(URLQueryItem(name: "offset", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
