// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Tell grabbers to discover devices
    public struct DiscoverDevices: PlexOperation {
        public typealias Success = MediaContainerWithDevice

        public static let operationID = "discoverDevices"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        /// Protocol to filter discovery.
        public var `protocol`: DiscoverDevicesProtocol?

        /// Targeted grabber identifier.
        public var grabberIdentifier: String?

        public init(
            `protocol`: DiscoverDevicesProtocol? = nil,
            grabberIdentifier: String? = nil
        ) {
            self.`protocol` = `protocol`
            self.grabberIdentifier = grabberIdentifier
        }

        public var path: String { "/media/grabbers/devices/discover" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = `protocol` {
                items.append(URLQueryItem(name: "protocol", value: QueryValue(value).encoded))
            }
            if let value = grabberIdentifier {
                items.append(URLQueryItem(name: "grabberIdentifier", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
