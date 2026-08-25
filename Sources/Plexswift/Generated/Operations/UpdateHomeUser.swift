// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Update a Plex Home user.
    public struct UpdateHomeUser: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "updateHomeUser"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.plexTVv1
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the user
        public var userId: Int

        public init(
            userId: Int
        ) {
            self.userId = userId
        }

        public var path: String { "/home/users/\(PathComponent(userId))" }
    }
}
