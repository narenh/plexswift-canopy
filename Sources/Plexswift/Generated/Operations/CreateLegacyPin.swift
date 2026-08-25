// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Legacy PIN creation (XML).
    public struct CreateLegacyPin: PlexOperation {
        public typealias Success = String

        public static let operationID = "createLegacyPin"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.plexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/pins.xml" }
    }
}
