// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Add a device to an existing DVR
    public struct AddDeviceToDVR: PlexOperation {
        public typealias Success = AddDeviceToDVRResponse

        public static let operationID = "addDeviceToDVR"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the DVR.
        public var dvrId: Int

        /// The ID of the device to add.
        public var deviceId: Int

        public init(
            dvrId: Int,
            deviceId: Int
        ) {
            self.dvrId = dvrId
            self.deviceId = deviceId
        }

        public var path: String { "/livetv/dvrs/\(PathComponent(dvrId))/devices/\(PathComponent(deviceId))" }
    }
}
