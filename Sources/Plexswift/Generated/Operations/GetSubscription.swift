// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Get a single subscription and potentially the grabs too
    public struct GetSubscription: PlexOperation {
        public typealias Success = MediaContainerWithSubscription

        public static let operationID = "getSubscription"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the subscription
        public var subscriptionId: Int

        /// Indicates whether the active grabs should be included as well
        public var includeGrabs: BoolInt?

        /// Compute the storage of recorded items desired by this subscription
        public var includeStorage: BoolInt?

        public init(
            subscriptionId: Int,
            includeGrabs: BoolInt? = nil,
            includeStorage: BoolInt? = nil
        ) {
            self.subscriptionId = subscriptionId
            self.includeGrabs = includeGrabs
            self.includeStorage = includeStorage
        }

        public var path: String { "/media/subscriptions/\(PathComponent(subscriptionId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = includeGrabs {
                items.append(URLQueryItem(name: "includeGrabs", value: QueryValue(value).encoded))
            }
            if let value = includeStorage {
                items.append(URLQueryItem(name: "includeStorage", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
