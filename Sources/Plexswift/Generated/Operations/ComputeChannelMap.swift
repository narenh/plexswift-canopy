// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Compute the best channel map, given device and lineup
    public struct ComputeChannelMap: PlexOperation {
        public typealias Success = ComputeChannelMapResponse

        public static let operationID = "computeChannelMap"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The URI describing the device
        public var device: String

        /// The URI describing the lineup
        public var lineup: String

        public init(
            device: String,
            lineup: String
        ) {
            self.device = device
            self.lineup = lineup
        }

        public var path: String { "/livetv/epg/channelmap" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = device
                items.append(URLQueryItem(name: "device", value: QueryValue(value).encoded))
            }
            do {
                let value = lineup
                items.append(URLQueryItem(name: "lineup", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
