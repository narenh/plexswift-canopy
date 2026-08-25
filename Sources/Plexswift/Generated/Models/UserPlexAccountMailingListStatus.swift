// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Your current mailing list status
public enum UserPlexAccountMailingListStatus: String, Codable, Hashable, Sendable, CaseIterable {
    case active = "active"
    case unsubscribed = "unsubscribed"
    case removed = "removed"
}
