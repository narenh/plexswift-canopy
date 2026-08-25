// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a marker for this user on the metadata item
    public struct DeleteMarker: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteMarker"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The marker identifier
        public var marker: String

        public init(
            ids: String,
            marker: String
        ) {
            self.ids = ids
            self.marker = marker
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/marker/\(PathComponent(marker))" }
    }
}
