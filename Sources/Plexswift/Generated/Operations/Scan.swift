// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Tell a device to scan for channels
    public struct Scan: PlexOperation {
        public typealias Success = MediaContainerWithDevice

        public static let operationID = "scan"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the device.
        public var deviceId: Int

        /// A valid source for the scan
        public var source: String?

        public init(
            deviceId: Int,
            source: String? = nil
        ) {
            self.deviceId = deviceId
            self.source = source
        }

        public var path: String { "/media/grabbers/devices/\(PathComponent(deviceId))/scan" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = source {
                items.append(URLQueryItem(name: "source", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
