// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The auto-select subtitle mode (0 = Manually selected, 1 = Shown with foreign audio, 2 = Always
/// enabled)
public enum UserProfileAutoSelectSubtitle: Int, Codable, Hashable, Sendable, CaseIterable {
    case n0 = 0
    case n1 = 1
    case n2 = 2
}
