// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Trigger a metadata refresh for a library section.
    public struct RefreshSectionPost: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "refreshSectionPost"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Section identifier
        public var sectionId: Int

        /// Whether the update of metadata and items should be performed even if modification dates indicate
        /// the items have not change
        public var force: BoolInt?

        /// Restrict refresh to the specified path
        public var path2: String?

        public init(
            sectionId: Int,
            force: BoolInt? = nil,
            path2: String? = nil
        ) {
            self.sectionId = sectionId
            self.force = force
            self.path2 = path2
        }

        public var path: String { "/library/sections/\(PathComponent(sectionId))/refresh" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = force {
                items.append(URLQueryItem(name: "force", value: QueryValue(value).encoded))
            }
            if let value = path2 {
                items.append(URLQueryItem(name: "path", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
