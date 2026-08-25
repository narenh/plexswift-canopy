// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Optimize the database globally across all library sections.
    public struct OptimizeLibraryPost: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "optimizeLibraryPost"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        public var path: String { "/library/optimize" }
    }
}
