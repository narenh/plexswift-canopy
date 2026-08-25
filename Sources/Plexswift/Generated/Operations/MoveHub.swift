// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Changed the ordering of a hub among others hubs
    public struct MoveHub: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "moveHub"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The section ID for the hubs to reorder
        public var sectionId: Int

        /// The identifier of the hub to move
        public var identifier: String

        /// The identifier of the hub to order this hub after (or empty/missing to put this hub first)
        public var after: String?

        public init(
            sectionId: Int,
            identifier: String,
            after: String? = nil
        ) {
            self.sectionId = sectionId
            self.identifier = identifier
            self.after = after
        }

        public var path: String { "/hubs/sections/\(PathComponent(sectionId))/manage/move" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = identifier
                items.append(URLQueryItem(name: "identifier", value: QueryValue(value).encoded))
            }
            if let value = after {
                items.append(URLQueryItem(name: "after", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
