// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the conversion/optimization queue.
    public struct GetConversionQueue: PlexOperation {
        public typealias Success = MediaContainerWithPlayQueue

        public static let operationID = "getConversionQueue"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/playQueues/1" }
    }
}
