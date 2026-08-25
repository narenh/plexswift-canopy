// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List channels directly associated with a DVR.
    public struct GetDVRChannels: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getDVRChannels"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the DVR.
        public var dvrId: Int

        public init(
            dvrId: Int
        ) {
            self.dvrId = dvrId
        }

        public var path: String { "/livetv/dvrs/\(PathComponent(dvrId))/channels" }
    }
}
