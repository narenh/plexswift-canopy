// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Download server logs bundle.
    public struct DownloadLogBundle: PlexOperation {
        public typealias Success = BinaryResponse

        public static let operationID = "downloadLogBundle"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/diagnostics/logs" }
    }
}
