// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of friends and shared users.
    public struct GetFriends: PlexOperation {
        public typealias Success = GetFriendsResponse

        public static let operationID = "getFriends"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/friends" }
    }
}
