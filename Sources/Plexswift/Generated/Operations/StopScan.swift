// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Tell a device to stop scanning for channels
    public struct StopScan: PlexOperation {
        public typealias Success = MediaContainerWithDevice

        public static let operationID = "stopScan"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the device.
        public var deviceId: Int

        public init(
            deviceId: Int
        ) {
            self.deviceId = deviceId
        }

        public var path: String { "/media/grabbers/devices/\(PathComponent(deviceId))/scan" }
    }
}
