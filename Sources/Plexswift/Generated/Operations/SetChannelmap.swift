// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set a device's channel mapping
    public struct SetChannelmap: PlexOperation {
        public typealias Success = MediaContainerWithDevice

        public static let operationID = "setChannelmap"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the device.
        public var deviceId: Int

        /// The mapping of changes, passed as a map of device channel to lineup VCN.
        public var channelMapping: AnyJSON?

        /// The mapping of changes, passed as a map of device channel to lineup key.
        public var channelMappingByKey: AnyJSON?

        /// The channels which are enabled.
        public var channelsEnabled: [String]?

        public init(
            deviceId: Int,
            channelMapping: AnyJSON? = nil,
            channelMappingByKey: AnyJSON? = nil,
            channelsEnabled: [String]? = nil
        ) {
            self.deviceId = deviceId
            self.channelMapping = channelMapping
            self.channelMappingByKey = channelMappingByKey
            self.channelsEnabled = channelsEnabled
        }

        public var path: String { "/media/grabbers/devices/\(PathComponent(deviceId))/channelmap" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = channelMapping {
                items.append(URLQueryItem(name: "channelMapping", value: QueryValue(value).encoded))
            }
            if let value = channelMappingByKey {
                items.append(URLQueryItem(name: "channelMappingByKey", value: QueryValue(value).encoded))
            }
            if let value = channelsEnabled {
                for element in value {
                    items.append(URLQueryItem(name: "channelsEnabled", value: QueryValue(element).encoded))
                }
            }
            return items
        }
    }
}
