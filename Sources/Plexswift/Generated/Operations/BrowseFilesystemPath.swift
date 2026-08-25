// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Browse a specific filesystem path.
    public struct BrowseFilesystemPath: PlexOperation {
        public typealias Success = MediaContainerWithDirectory

        public static let operationID = "browseFilesystemPath"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The base64path
        public var base64path: String

        public init(
            base64path: String
        ) {
            self.base64path = base64path
        }

        public var path: String { "/services/browse/\(PathComponent(base64path))" }
    }
}
