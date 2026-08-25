// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get artwork for a library section
    public struct GetArts: PlexOperation {
        public typealias Success = MediaContainerWithArtwork

        public static let operationID = "getArts"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Section identifier
        public var sectionId: Int

        public init(
            sectionId: Int
        ) {
            self.sectionId = sectionId
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/arts" }
    }
}
