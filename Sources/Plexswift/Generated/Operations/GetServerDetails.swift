// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get server details for sharing.
    public struct GetServerDetails: PlexOperation {
        public typealias Success = ServerConfiguration

        public static let operationID = "getServerDetails"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv1
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique machine identifier of the server
        public var machineId: String

        public init(
            machineId: String
        ) {
            self.machineId = machineId
        }

        public var path: String { "/servers/\(PathComponent(machineId))" }
    }
}
