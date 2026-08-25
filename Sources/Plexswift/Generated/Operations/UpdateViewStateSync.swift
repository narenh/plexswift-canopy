// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Enable or disable watch-state sync consent for the logged-in user.
    public struct UpdateViewStateSync: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "updateViewStateSync"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/user/view_state_sync" }
    }
}
