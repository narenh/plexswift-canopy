// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Compute the best lineup, given lineup group and device
    public struct GetLineup: PlexOperation {
        public typealias Success = MediaContainerWithLineup

        public static let operationID = "getLineup"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The URI describing the device
        public var device: String

        /// The URI describing the lineupGroup
        public var lineupGroup: String

        public init(
            device: String,
            lineupGroup: String
        ) {
            self.device = device
            self.lineupGroup = lineupGroup
        }

        public var path: String { "/livetv/epg/lineup" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = device
                items.append(URLQueryItem(name: "device", value: QueryValue(value).encoded))
            }
            do {
                let value = lineupGroup
                items.append(URLQueryItem(name: "lineupGroup", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
