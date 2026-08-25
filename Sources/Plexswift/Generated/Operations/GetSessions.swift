// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get all livetv sessions and metadata
    public struct GetSessions: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getSessions"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        /// Filter by DVR ID.
        public var dvrId: Int?

        /// Filter by channel ID.
        public var channel: Int?

        public init(
            dvrId: Int? = nil,
            channel: Int? = nil
        ) {
            self.dvrId = dvrId
            self.channel = channel
        }

        public var path: String { "/livetv/sessions" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = dvrId {
                items.append(URLQueryItem(name: "dvrId", value: QueryValue(value).encoded))
            }
            if let value = channel {
                items.append(URLQueryItem(name: "channel", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
