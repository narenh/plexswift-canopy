// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Share a library with a friend (legacy v1 XML endpoint).
    public struct ShareServerLegacy: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "shareServerLegacy"
        public static let method = HTTPMethod.post
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

        public var path: String { "/servers/\(PathComponent(machineId))/shared_servers" }
    }
}
