// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Remove a share / friend.
    public struct RemoveShare: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "removeShare"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the user
        public var userId: Int

        public init(
            userId: Int
        ) {
            self.userId = userId
        }

        public var path: String { "/sharings/\(PathComponent(userId))" }
    }
}
