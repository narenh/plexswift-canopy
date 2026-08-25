// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// This endpoint adds a device to an existing grabber. The device is identified, and added to the
    /// correct grabber.
    public struct AddDevice: PlexOperation {
        public typealias Success = MediaContainerWithDevice

        public static let operationID = "addDevice"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The URI of the device.
        public var uri: String?

        public init(
            uri: String? = nil
        ) {
            self.uri = uri
        }

        public var path: String { "/media/grabbers/devices" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = uri {
                items.append(URLQueryItem(name: "uri", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
