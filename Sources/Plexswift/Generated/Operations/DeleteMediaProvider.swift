// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Deletes a media provider with the given id
    public struct DeleteMediaProvider: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteMediaProvider"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The ID of the media provider to delete
        public var provider: String

        public init(
            provider: String
        ) {
            self.provider = provider
        }

        public var path: String { "/media/providers/\(PathComponent(provider))" }
    }
}
