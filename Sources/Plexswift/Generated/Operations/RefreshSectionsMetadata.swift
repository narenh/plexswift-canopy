// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Tell PMS to refresh all section metadata
    public struct RefreshSectionsMetadata: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "refreshSectionsMetadata"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Force refresh of metadata
        public var force: Bool?

        public init(
            force: Bool? = nil
        ) {
            self.force = force
        }

        public var path: String { "/library/sections/refresh" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = force {
                items.append(URLQueryItem(name: "force", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
