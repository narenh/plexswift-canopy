// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Perform an update check and potentially download
    public struct CheckUpdates: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "checkUpdates"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Indicate that you want to start download any updates found.
        public var download: BoolInt?

        public init(
            download: BoolInt? = nil
        ) {
            self.download = download
        }

        public var path: String { "/updater/check" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = download {
                items.append(URLQueryItem(name: "download", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
