// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Tune a channel on a DVR to the provided channel
    public struct TuneChannel: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "tuneChannel"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the DVR.
        public var dvrId: Int

        /// The channel ID to tune
        public var channel: String

        public init(
            dvrId: Int,
            channel: String
        ) {
            self.dvrId = dvrId
            self.channel = channel
        }

        public var path: String { "/livetv/dvrs/\(PathComponent(dvrId))/channels/\(PathComponent(channel))/tune" }
    }
}
