// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a custom hub from the server
    public struct DeleteCustomHub: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteCustomHub"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section ID for the hubs to change
        public var sectionId: Int

        /// The identifier of the hub to change
        public var identifier: String

        public init(
            sectionId: Int,
            identifier: String
        ) {
            self.sectionId = sectionId
            self.identifier = identifier
        }

        public var path: String { "/hubs/sections/\(PathComponent(sectionId))/manage/\(PathComponent(identifier))" }
    }
}
