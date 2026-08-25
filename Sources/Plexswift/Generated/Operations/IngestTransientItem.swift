// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint takes a file path specified in the `url` parameter, matches it using the scanner's
    /// match mechanism, downloads rich metadata, and then ingests the item as a transient item (without
    /// a library section). In the case where the file represents an episode, the entire tree (show,
    /// season, and episode) is added as transient items. At this time, movies and episodes are the only
    /// supported types, which are gleaned automatically from the file path.
    /// Note that any of the parameters passed to the metadata details endpoint (e.g. `includeExtras=1`)
    /// work here.
    public struct IngestTransientItem: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "ingestTransientItem"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The file of the file to ingest.
        public var url: String?

        /// A virtual path to use when the url is opaque.
        public var virtualFilePath: String?

        /// Whether or not to compute Plex and OpenSubtitle hashes for the file. Defaults to 0.
        public var computeHashes: BoolInt?

        /// Whether or not non matching media should be stored. Defaults to 0.
        public var ingestNonMatches: BoolInt?

        public init(
            url: String? = nil,
            virtualFilePath: String? = nil,
            computeHashes: BoolInt? = nil,
            ingestNonMatches: BoolInt? = nil
        ) {
            self.url = url
            self.virtualFilePath = virtualFilePath
            self.computeHashes = computeHashes
            self.ingestNonMatches = ingestNonMatches
        }

        public var path: String { "/library/file" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = url {
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            if let value = virtualFilePath {
                items.append(URLQueryItem(name: "virtualFilePath", value: QueryValue(value).encoded))
            }
            if let value = computeHashes {
                items.append(URLQueryItem(name: "computeHashes", value: QueryValue(value).encoded))
            }
            if let value = ingestNonMatches {
                items.append(URLQueryItem(name: "ingestNonMatches", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
