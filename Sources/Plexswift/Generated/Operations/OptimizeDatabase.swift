// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Initiate optimize on the database.
    public struct OptimizeDatabase: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "optimizeDatabase"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// If set, don't wait for completion but return an activity
        public var `async`: BoolInt?

        public init(
            async: BoolInt? = nil
        ) {
            self.`async` = `async`
        }

        public var path: String { "/library/optimize" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = `async` {
                items.append(URLQueryItem(name: "async", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
