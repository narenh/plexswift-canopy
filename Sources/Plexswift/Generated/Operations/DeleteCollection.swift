// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a library collection from the PMS
    public struct DeleteCollection: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteCollection"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Section identifier
        public var sectionId: Int

        /// Collection Id
        public var collectionId: Int

        public init(
            sectionId: Int,
            collectionId: Int
        ) {
            self.sectionId = sectionId
            self.collectionId = collectionId
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/collection/\(PathComponent(collectionId))" }
    }
}
