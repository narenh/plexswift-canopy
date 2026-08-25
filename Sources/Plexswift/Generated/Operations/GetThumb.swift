// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a device's thumb for display to the user
    public struct GetThumb: PlexOperation {
        public typealias Success = Data

        public static let operationID = "getThumb"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the device.
        public var deviceId: Int

        /// A version number of the thumb used for busting cache
        public var version: Int

        public init(
            deviceId: Int,
            version: Int
        ) {
            self.deviceId = deviceId
            self.version = version
        }

        public var path: String { "/media/grabbers/devices/\(PathComponent(deviceId))/thumb/\(PathComponent(version))" }
    }
}
