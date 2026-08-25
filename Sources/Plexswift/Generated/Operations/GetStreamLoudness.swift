// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// The the loudness of a stream in db, one number per line, one entry per 100ms
    public struct GetStreamLoudness: PlexOperation {
        public typealias Success = String

        public static let operationID = "getStreamLoudness"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the stream
        public var streamId: Int

        /// Subsample result down to return only the provided number of samples
        public var subsample: Int?

        public init(
            streamId: Int,
            subsample: Int? = nil
        ) {
            self.streamId = streamId
            self.subsample = subsample
        }

        public var path: String { "/library/streams/\(PathComponent(streamId))/loudness" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = subsample {
                items.append(URLQueryItem(name: "subsample", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
