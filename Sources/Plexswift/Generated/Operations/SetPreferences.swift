// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Set a set of preferences in query parameters
    public struct SetPreferences: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "setPreferences"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The preference key to retrieve or set
        public var prefs: AnyJSON

        public init(
            prefs: AnyJSON
        ) {
            self.prefs = prefs
        }

        public var path: String { "/:/prefs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = prefs
                items.append(URLQueryItem(name: "prefs", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
