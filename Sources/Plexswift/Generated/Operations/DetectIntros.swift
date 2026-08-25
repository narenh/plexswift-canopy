// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Start the detection of intros in a metadata item
    public struct DetectIntros: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "detectIntros"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Comma-separated list of IDs
        public var ids: String

        /// Indicate whether detection should be re-run
        public var force: BoolInt?

        /// The threshold for determining if content is an intro or not
        public var threshold: Double?

        public init(
            ids: String,
            force: BoolInt? = nil,
            threshold: Double? = nil
        ) {
            self.ids = ids
            self.force = force
            self.threshold = threshold
        }

        public var path: String { "/library/metadata/\(PathComponent(ids))/intro" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = force {
                items.append(URLQueryItem(name: "force", value: QueryValue(value).encoded))
            }
            if let value = threshold {
                items.append(URLQueryItem(name: "threshold", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
