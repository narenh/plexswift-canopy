// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Add a subtitle to a metadata item
    public struct GetSubtitles: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getSubtitles"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The title to filter by
        public var title: String?

        /// The language code to use
        public var language: String?

        /// The unique identifier of the mediaitem
        public var mediaItemID: Int?

        /// The URL of the subtitle. If not provided, the contents of the subtitle must be in the post body
        public var url: String?

        /// The format
        public var format: String?

        /// The forced
        public var forced: BoolInt?

        /// The hearingImpaired
        public var hearingImpaired: BoolInt?

        public init(
            ids: String,
            title: String? = nil,
            language: String? = nil,
            mediaItemID: Int? = nil,
            url: String? = nil,
            format: String? = nil,
            forced: BoolInt? = nil,
            hearingImpaired: BoolInt? = nil
        ) {
            self.ids = ids
            self.title = title
            self.language = language
            self.mediaItemID = mediaItemID
            self.url = url
            self.format = format
            self.forced = forced
            self.hearingImpaired = hearingImpaired
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/subtitles" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = title {
                items.append(URLQueryItem(name: "title", value: QueryValue(value).encoded))
            }
            if let value = language {
                items.append(URLQueryItem(name: "language", value: QueryValue(value).encoded))
            }
            if let value = mediaItemID {
                items.append(URLQueryItem(name: "mediaItemID", value: QueryValue(value).encoded))
            }
            if let value = url {
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            if let value = format {
                items.append(URLQueryItem(name: "format", value: QueryValue(value).encoded))
            }
            if let value = forced {
                items.append(URLQueryItem(name: "forced", value: QueryValue(value).encoded))
            }
            if let value = hearingImpaired {
                items.append(URLQueryItem(name: "hearingImpaired", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
