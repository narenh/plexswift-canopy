// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get all subscriptions and potentially the grabs too
    public struct GetAllSubscriptions: PlexOperation {
        public typealias Success = MediaContainerWithSubscription

        public static let operationID = "getAllSubscriptions"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// Indicates whether the active grabs should be included as well
        public var includeGrabs: BoolInt?

        /// Compute the storage of recorded items desired by this subscription
        public var includeStorage: BoolInt?

        /// Pagination start offset.
        public var xPlexContainerStart: Int?

        /// Pagination page size.
        public var xPlexContainerSize: Int?

        public init(
            includeGrabs: BoolInt? = nil,
            includeStorage: BoolInt? = nil,
            xPlexContainerStart: Int? = nil,
            xPlexContainerSize: Int? = nil
        ) {
            self.includeGrabs = includeGrabs
            self.includeStorage = includeStorage
            self.xPlexContainerStart = xPlexContainerStart
            self.xPlexContainerSize = xPlexContainerSize
        }

        public var path: String { "/media/subscriptions" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = includeGrabs {
                items.append(URLQueryItem(name: "includeGrabs", value: QueryValue(value).encoded))
            }
            if let value = includeStorage {
                items.append(URLQueryItem(name: "includeStorage", value: QueryValue(value).encoded))
            }
            if let value = xPlexContainerStart {
                items.append(URLQueryItem(name: "X-Plex-Container-Start", value: QueryValue(value).encoded))
            }
            if let value = xPlexContainerSize {
                items.append(URLQueryItem(name: "X-Plex-Container-Size", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
