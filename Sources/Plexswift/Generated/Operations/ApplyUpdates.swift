// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Apply any downloaded updates. Note that the two parameters `tonight` and `skip` are effectively
    /// mutually exclusive. The `tonight` parameter takes precedence and `skip` will be ignored if
    /// `tonight` is also passed.
    public struct ApplyUpdates: PlexOperation {
        public typealias Success = String

        public static let operationID = "applyUpdates"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Indicate that you want the update to run during the next Butler execution. Omitting this or
        /// setting it to false indicates that the update should install immediately.
        public var tonight: BoolInt?

        /// Indicate that the latest version should be marked as skipped. The <Release> entry for this
        /// version will have the `state` set to `skipped`.
        public var skip: BoolInt?

        public init(
            tonight: BoolInt? = nil,
            skip: BoolInt? = nil
        ) {
            self.tonight = tonight
            self.skip = skip
        }

        public var path: String { "/updater/apply" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = tonight {
                items.append(URLQueryItem(name: "tonight", value: QueryValue(value).encoded))
            }
            if let value = skip {
                items.append(URLQueryItem(name: "skip", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
