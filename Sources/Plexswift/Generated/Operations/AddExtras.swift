// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Add an extra to a metadata item
    public struct AddExtras: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "addExtras"
        public static let method = HTTPMethod.post
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The title to filter by or assign
        public var title: String?

        /// Comma-separated list of IDs
        public var ids: String

        /// The metadata type of the extra
        public var extraType: Int?

        /// The URL of the extra
        public var url: String

        public init(
            title: String? = nil,
            ids: String,
            extraType: Int? = nil,
            url: String
        ) {
            self.title = title
            self.ids = ids
            self.extraType = extraType
            self.url = url
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/extras" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = title {
                items.append(URLQueryItem(name: "title", value: QueryValue(value).encoded))
            }
            if let value = extraType {
                items.append(URLQueryItem(name: "extraType", value: QueryValue(value).encoded))
            }
            do {
                let value = url
                items.append(URLQueryItem(name: "url", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
