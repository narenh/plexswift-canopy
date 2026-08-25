// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Poll the PIN status. Returns authToken when the user has linked the device.
    public struct GetOAuthPin: PlexOperation {
        public typealias Success = GetOAuthPinResponse

        public static let operationID = "getOAuthPin"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTVv2
        public static let requiresToken = false
        public static let requiresClientIdentifier = true

        /// The unique identifier of the pin
        public var pinId: Int

        public init(
            pinId: Int
        ) {
            self.pinId = pinId
        }

        public var path: String { "/pins/\(PathComponent(pinId))" }
    }
}
