// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a single preference and value
    public struct GetPreference: PlexOperation {
        public typealias Success = MediaContainerWithSettings

        public static let operationID = "getPreference"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The preference to fetch
        public var id: String?

        public init(
            id: String? = nil
        ) {
            self.id = id
        }

        public var path: String { "/:/prefs/get" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = id {
                items.append(URLQueryItem(name: "id", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
