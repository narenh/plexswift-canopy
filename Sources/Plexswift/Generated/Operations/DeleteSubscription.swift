// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// Delete a subscription, cancelling all of its grabs as well
    public struct DeleteSubscription: PlexOperation {
        public typealias Success = SuccessResponse

        public static let operationID = "deleteSubscription"
        public static let method = HTTPMethod.delete
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

        /// The unique identifier of the subscription
        public var subscriptionId: Int

        public init(
            subscriptionId: Int
        ) {
            self.subscriptionId = subscriptionId
        }

        public var path: String { "/media/subscriptions/\(PathComponent(subscriptionId))" }
    }
}
