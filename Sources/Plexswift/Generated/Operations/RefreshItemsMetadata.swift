// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Refresh a metadata item from the agent
    public struct RefreshItemsMetadata: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "refreshItemsMetadata"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The identifier of the metadata agent to use
        public var agent: String?

        /// The markUpdated
        public var markUpdated: BoolInt?

        /// Skip synchronous refresh
        public var skipRefresh: BoolInt?

        public init(
            ids: String,
            agent: String? = nil,
            markUpdated: BoolInt? = nil,
            skipRefresh: BoolInt? = nil
        ) {
            self.ids = ids
            self.agent = agent
            self.markUpdated = markUpdated
            self.skipRefresh = skipRefresh
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/refresh" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = agent {
                items.append(URLQueryItem(name: "agent", value: QueryValue(value).encoded))
            }
            if let value = markUpdated {
                items.append(URLQueryItem(name: "markUpdated", value: QueryValue(value).encoded))
            }
            if let value = skipRefresh {
                items.append(URLQueryItem(name: "skipRefresh", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
