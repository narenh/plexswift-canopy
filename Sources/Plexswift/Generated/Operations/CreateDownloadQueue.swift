// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Available: 0.2.0
    ///
    /// Creates a download queue for this client if one doesn't exist, or returns the existing queue for
    /// this client and user.
    public struct CreateDownloadQueue: PlexOperation {
        public typealias Success = CreateDownloadQueueResponse

        public static let operationID = "createDownloadQueue"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/downloadQueue" }
    }
}
