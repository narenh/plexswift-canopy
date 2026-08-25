// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a section's preferences for a metadata type
    public struct GetSectionsPrefs: PlexOperation {
        public typealias Success = MediaContainerWithSettings

        public static let operationID = "getSectionsPrefs"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The metadata type
        public var type: Int

        /// The metadata agent in use
        public var agent: String?

        public init(
            type: Int,
            agent: String? = nil
        ) {
            self.type = type
            self.agent = agent
        }

        public var path: String { "/library/sections/prefs" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            do {
                let value = type
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            if let value = agent {
                items.append(URLQueryItem(name: "agent", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
