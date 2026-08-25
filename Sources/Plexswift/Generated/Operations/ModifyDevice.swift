// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Enable or disable a device by its id
    public struct ModifyDevice: PlexOperation {
        public typealias Success = ModifyDeviceResponse

        public static let operationID = "modifyDevice"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the device.
        public var deviceId: Int

        /// Whether to enable the device
        public var enabled: BoolInt?

        public init(
            deviceId: Int,
            enabled: BoolInt? = nil
        ) {
            self.deviceId = deviceId
            self.enabled = enabled
        }

        public var path: String { "/media/grabbers/devices/\(PathComponent(deviceId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = enabled {
                items.append(URLQueryItem(name: "enabled", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
