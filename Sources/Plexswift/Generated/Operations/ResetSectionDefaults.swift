// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Reset hubs for this section to defaults and delete custom hubs
    public struct ResetSectionDefaults: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "resetSectionDefaults"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section ID for the hubs to reorder
        public var sectionId: Int

        public init(
            sectionId: Int
        ) {
            self.sectionId = sectionId
        }

        public var path: String { "/hubs/sections/\(PathComponent(sectionId))/manage" }
    }
}
