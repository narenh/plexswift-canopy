// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Information about this PMS setup and configuration
    public struct GetServerInfo: PlexOperation {
        public typealias Success = GetServerInfoResponse

        public static let operationID = "getServerInfo"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/" }
    }
}
