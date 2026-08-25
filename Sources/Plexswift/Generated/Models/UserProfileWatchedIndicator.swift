// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Whether or not media watched indicators are enabled (little orange dot on media)
public enum UserProfileWatchedIndicator: Int, Codable, Hashable, Sendable, CaseIterable {
    case n0 = 0
    case n1 = 1
    case n2 = 2
    case n3 = 3
}
