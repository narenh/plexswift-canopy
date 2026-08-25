// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the list of all devices present
    public struct ListDevices: PlexOperation {
        public typealias Success = MediaContainerWithDevice

        public static let operationID = "listDevices"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/media/grabbers/devices" }
    }
}
