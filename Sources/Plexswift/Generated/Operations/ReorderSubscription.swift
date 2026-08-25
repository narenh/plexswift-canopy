// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Re-order a subscription to change its priority
    public struct ReorderSubscription: PlexOperation {
        public typealias Success = MediaContainerWithSubscription

        public static let operationID = "reorderSubscription"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the subscription
        public var subscriptionId: Int

        /// The subscription to move this sub after. If missing will insert at the beginning of the list
        public var after: Int?

        public init(
            subscriptionId: Int,
            after: Int? = nil
        ) {
            self.subscriptionId = subscriptionId
            self.after = after
        }

        public var path: String { "/media/subscriptions/\(PathComponent(subscriptionId))/move" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = after {
                items.append(URLQueryItem(name: "after", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
