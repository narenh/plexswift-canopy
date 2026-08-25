// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get online media source opt-out settings for a user.
    public struct GetUserOptOuts: PlexOperation {
        public typealias Success = UserOptOutsResponse

        public static let operationID = "getUserOptOuts"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The universally unique identifier
        public var uuid: String

        public init(
            uuid: String
        ) {
            self.uuid = uuid
        }

        public var path: String { "/user/\(PathComponent(uuid))/settings/opt_outs" }
    }
}
