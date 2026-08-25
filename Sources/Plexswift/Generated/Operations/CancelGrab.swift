// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Cancels an existing media grab (recording). It can be used to resolve a conflict which exists
    /// for a rolling subscription.
    /// Note: This cancellation does not persist across a server restart, but neither does a rolling
    /// subscription itself.
    public struct CancelGrab: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "cancelGrab"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the operation.
        public var operationId: String

        public init(
            operationId: String
        ) {
            self.operationId = operationId
        }

        public var path: String { "/media/grabbers/operations/\(PathComponent(operationId))" }
    }
}
