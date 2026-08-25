// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Edit a subscription's preferences
    public struct EditSubscriptionPreferences: PlexOperation {
        public typealias Success = MediaContainerWithSubscription

        public static let operationID = "editSubscriptionPreferences"
        public static let method = HTTPMethod.put
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the subscription
        public var subscriptionId: Int

        /// The preference key to retrieve or set
        public var prefs: AnyJSON?

        public init(
            subscriptionId: Int,
            prefs: AnyJSON? = nil
        ) {
            self.subscriptionId = subscriptionId
            self.prefs = prefs
        }

        public var path: String { "/media/subscriptions/\(PathComponent(subscriptionId))" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = prefs {
                items.append(URLQueryItem(name: "prefs", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
