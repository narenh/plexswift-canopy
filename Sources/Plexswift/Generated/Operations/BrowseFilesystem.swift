// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Browse filesystem paths accessible to the server.
    public struct BrowseFilesystem: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "browseFilesystem"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Include files in browse results
        public var includeFiles: BoolInt?

        public init(
            includeFiles: BoolInt? = nil
        ) {
            self.includeFiles = includeFiles
        }

        public var path: String { "/services/browse" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = includeFiles {
                items.append(URLQueryItem(name: "includeFiles", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
