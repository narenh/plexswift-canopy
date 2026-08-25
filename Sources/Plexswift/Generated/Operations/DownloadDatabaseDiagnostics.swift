// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Download server database diagnostics bundle.
    public struct DownloadDatabaseDiagnostics: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "downloadDatabaseDiagnostics"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/diagnostics/databases" }
    }
}
