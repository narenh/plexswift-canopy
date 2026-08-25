// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// List completed DVR recordings.
    public struct GetDVRRecordings: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getDVRRecordings"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/livetv/recordings" }
    }
}
