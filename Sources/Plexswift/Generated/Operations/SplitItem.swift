// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Split a metadata item into multiple items
    public struct SplitItem: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "splitItem"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        public init(
            ids: String
        ) {
            self.ids = ids
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/split" }
    }
}
