// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a stream (such as a sidecar subtitle stream)
    public struct GetStream: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getStream"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The id of the stream
        public var streamId: Int

        /// The extension of the stream. Required to fetch the `sub` portion of `idx`/`sub` subtitles
        public var ext: String

        /// The requested encoding for the subtitle (only used for text subtitles)
        public var encoding: String?

        /// The requested format for the subtitle to convert the subtitles to (only used for text subtitles)
        public var format: String?

        /// Whether the server should attempt to automatically adjust the subtitle timestamps to match the
        /// media
        public var autoAdjustSubtitle: BoolInt?

        public init(
            streamId: Int,
            ext: String,
            encoding: String? = nil,
            format: String? = nil,
            autoAdjustSubtitle: BoolInt? = nil
        ) {
            self.streamId = streamId
            self.ext = ext
            self.encoding = encoding
            self.format = format
            self.autoAdjustSubtitle = autoAdjustSubtitle
        }

        public var path: String { "/library/streams/\(PathComponent(streamId)).\(PathComponent(ext))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = encoding {
                items.append(URLQueryItem(name: "encoding", value: QueryValue(value).encoded))
            }
            if let value = format {
                items.append(URLQueryItem(name: "format", value: QueryValue(value).encoded))
            }
            if let value = autoAdjustSubtitle {
                items.append(URLQueryItem(name: "autoAdjustSubtitle", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
