// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// String representation of subscriptionActive
public enum PostUsersSignInDataResponseSubscriptionsItemStatus: String, Codable, Hashable, Sendable, CaseIterable {
    case inactive = "Inactive"
    case active = "Active"
}
