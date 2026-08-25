// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Switch to a Plex Home user and return a new auth token.
    public struct SwitchHomeUser: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "switchHomeUser"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTVv1
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the item
        public var id: Int

        public init(
            id: Int
        ) {
            self.id = id
        }

        public var path: String { "/home/users/\(PathComponent(id))/switch" }
    }
}
