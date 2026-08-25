// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Empty trash in the section, permanently deleting media/metadata for missing media
    public struct EmptyTrashPut: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "emptyTrashPut"
        public static let method = HTTPMethod.put
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

        public var path: String { "/library/sections/\(PathComponent(sectionId))/emptyTrash" }
    }
}
