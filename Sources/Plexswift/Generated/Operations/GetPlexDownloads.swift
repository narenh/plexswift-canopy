// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get available Plex update downloads for a specific channel (e.g. `plexpass`, `public`).
    public struct GetPlexDownloads: PlexOperation {
        public typealias Success = PlexDownloadsResponse

        public static let operationID = "getPlexDownloads"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.plexTV
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The channel identifier
        public var channel: String

        public init(
            channel: String
        ) {
            self.channel = channel
        }

        public var path: String { "/downloads/\(PathComponent(channel)).json" }
    }
}
