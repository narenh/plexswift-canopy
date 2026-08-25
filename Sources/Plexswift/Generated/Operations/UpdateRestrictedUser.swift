// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Update restricted (managed) home user settings.
    public struct UpdateRestrictedUser: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "updateRestrictedUser"
        public static let method = HTTPMethod.put
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

        public var path: String { "/home/users/restricted/\(PathComponent(userId))" }
    }
}
