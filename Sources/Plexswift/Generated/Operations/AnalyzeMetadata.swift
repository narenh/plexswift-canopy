// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Start the analysis of a metadata item
    public struct AnalyzeMetadata: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "analyzeMetadata"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// Set the offset to be used for thumbnails
        public var thumbOffset: Double?

        /// Set the offset to be used for artwork
        public var artOffset: Double?

        public init(
            ids: String,
            thumbOffset: Double? = nil,
            artOffset: Double? = nil
        ) {
            self.ids = ids
            self.thumbOffset = thumbOffset
            self.artOffset = artOffset
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/analyze" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = thumbOffset {
                items.append(URLQueryItem(name: "thumbOffset", value: QueryValue(value).encoded))
            }
            if let value = artOffset {
                items.append(URLQueryItem(name: "artOffset", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
