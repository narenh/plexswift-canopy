// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public struct ManagedHub: Codable, Hashable, Sendable {
    /// The title of this hub
    public let title: String?

    /// Whether this hub is visible on the home screen
    /// - all: Visible to all users
    /// - none: Visible to no users
    /// - admin: Visible to only admin users
    /// - shared: Visible to shared users
    public let homeVisibility: ManagedHubHomeVisibility?

    /// The identifier for this hub
    public let identifier: String?

    /// Whether this hub is visible to admin user home
    public let promotedToOwnHome: Bool?

    /// Whether this hub is promoted to all for recommendations
    public let promotedToRecommended: Bool?

    /// Whether this hub is visible to shared user's home
    public let promotedToSharedHome: Bool?

    /// The visibility of this hub in recommendations:
    /// - all: Visible to all users
    /// - none: Visible to no users
    /// - admin: Visible to only admin users
    /// - shared: Visible to shared users
    public let recommendationsVisibility: ManagedHubRecommendationsVisibility?

    public init(
        title: String? = nil,
        homeVisibility: ManagedHubHomeVisibility? = nil,
        identifier: String? = nil,
        promotedToOwnHome: Bool? = nil,
        promotedToRecommended: Bool? = nil,
        promotedToSharedHome: Bool? = nil,
        recommendationsVisibility: ManagedHubRecommendationsVisibility? = nil
    ) {
        self.title = title
        self.homeVisibility = homeVisibility
        self.identifier = identifier
        self.promotedToOwnHome = promotedToOwnHome
        self.promotedToRecommended = promotedToRecommended
        self.promotedToSharedHome = promotedToSharedHome
        self.recommendationsVisibility = recommendationsVisibility
    }
}
