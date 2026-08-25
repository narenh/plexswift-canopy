// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Fetch the global electronic program guide.
    public struct GetEPGGuide: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getEPGGuide"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = false

        public var path: String { "/livetv/epg/guide" }
    }
}
