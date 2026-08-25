// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a stream. Only applies to downloaded subtitle streams or a sidecar subtitle when media
    /// deletion is enabled.
    public struct DeleteStream: PlexOperation {
        public typealias Success = Data

        public static let operationID = "deleteStream"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the stream
        public var streamId: Int

        /// This is not a part of this endpoint but documented here to satisfy OpenAPI
        public var ext: String

        public init(
            streamId: Int,
            ext: String
        ) {
            self.streamId = streamId
            self.ext = ext
        }

        public var path: String { "/library/streams/\(PathComponent(streamId)).\(PathComponent(ext))" }
    }
}
