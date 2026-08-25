// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Whether this hub is visible on the home screen
/// - all: Visible to all users
/// - none: Visible to no users
/// - admin: Visible to only admin users
/// - shared: Visible to shared users
public enum ManagedHubHomeVisibility: String, Codable, Hashable, Sendable, CaseIterable {
    case all = "all"
    case `none` = "none"
    case admin = "admin"
    case shared = "shared"
}
