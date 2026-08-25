// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get the channels across multiple lineups
    public struct GetLineupChannels: PlexOperation {
        public typealias Success = GetLineupChannelsResponse

        public static let operationID = "getLineupChannels"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The URIs describing the lineups
        public var lineup: [String]

        public init(
            lineup: [String]
        ) {
            self.lineup = lineup
        }

        public var path: String { "/livetv/epg/lineupchannels" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = lineup
                for element in value {
                    items.append(URLQueryItem(name: "lineup", value: QueryValue(element).encoded))
                }
            }
            return items
        }
    }
}
