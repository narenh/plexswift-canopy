// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a list of connected Plex clients.
    public struct GetClients: PlexOperation {
        public typealias Success = GetClientsResponse

        public static let operationID = "getClients"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/clients" }
    }
}
