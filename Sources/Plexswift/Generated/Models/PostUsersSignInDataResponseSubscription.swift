// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// If the account's Plex Pass subscription is active
public struct PostUsersSignInDataResponseSubscription: Codable, Hashable, Sendable {
    /// If the account's Plex Pass subscription is active
    public let active: Bool?

    /// List of features allowed on your Plex Pass subscription
    public let features: [String]?

    /// Payment service used for your Plex Pass subscription
    public let paymentService: String?

    /// Name of Plex Pass subscription plan
    public let plan: String?

    /// String representation of subscriptionActive
    public let status: PostUsersSignInDataResponseSubscriptionStatus?

    /// Date the account subscribed to Plex Pass
    public let subscribedAt: String?

    public init(
        active: Bool? = nil,
        features: [String]? = nil,
        paymentService: String? = nil,
        plan: String? = nil,
        status: PostUsersSignInDataResponseSubscriptionStatus? = nil,
        subscribedAt: String? = nil
    ) {
        self.active = active
        self.features = features
        self.paymentService = paymentService
        self.plan = plan
        self.status = status
        self.subscribedAt = subscribedAt
    }
}
