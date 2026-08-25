// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set the preferences on a metadata item
    public struct SetItemPreferences: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "setItemPreferences"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// The args
        public var args: AnyJSON?

        public init(
            ids: String,
            args: AnyJSON? = nil
        ) {
            self.ids = ids
            self.args = args
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/prefs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = args {
                items.append(URLQueryItem(name: "args", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
