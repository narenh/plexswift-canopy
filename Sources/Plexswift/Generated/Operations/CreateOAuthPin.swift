// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Create a 4-character PIN for device linking via OAuth. The user must visit https://plex.tv/link
    /// and enter the PIN to authorize the device.
    public struct CreateOAuthPin: PlexOperation {
        public typealias Success = CreateOAuthPinResponse

        public static let operationID = "createOAuthPin"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = false
        public static let requiresClientIdentifier = true

        public var path: String { "/pins" }
    }
}
