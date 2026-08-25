// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set device preferences by its id
    public struct SetDevicePreferences: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "setDevicePreferences"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the device.
        public var deviceId: Int

        /// The preference names and values.
        public var name: String?

        /// Preference value to set.
        public var value: String?

        public init(
            deviceId: Int,
            name: String? = nil,
            value: String? = nil
        ) {
            self.deviceId = deviceId
            self.name = name
            self.value = value
        }

        public var path: String { "/media/grabbers/devices/\(PathComponent(deviceId))/prefs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = name {
                items.append(URLQueryItem(name: "name", value: QueryValue(value).encoded))
            }
            if let value = value {
                items.append(URLQueryItem(name: "value", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
