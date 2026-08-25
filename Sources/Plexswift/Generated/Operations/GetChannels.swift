// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get channels for a lineup within an EPG provider
    public struct GetChannels: PlexOperation {
        public typealias Success = ChannelResponse

        public static let operationID = "getChannels"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The URI describing the lineup
        public var lineup: String

        public init(
            lineup: String
        ) {
            self.lineup = lineup
        }

        public var path: String { "/livetv/epg/channels" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = lineup
                items.append(URLQueryItem(name: "lineup", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
