// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Browse items in a library section grouped by content rating.
    public struct GetByContentRating: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getByContentRating"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the library section
        public var sectionId: Int

        public init(
            sectionId: Int
        ) {
            self.sectionId = sectionId
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/byContentRating" }
    }
}
