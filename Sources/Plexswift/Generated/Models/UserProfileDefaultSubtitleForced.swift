// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The forced subtitles searches mode (0 = Prefer non-forced subtitles, 1 = Prefer forced
/// subtitles, 2 = Only show forced subtitles, 3 = Only show non-forced subtitles)
public enum UserProfileDefaultSubtitleForced: Int, Codable, Hashable, Sendable, CaseIterable {
    case n0 = 0
    case n1 = 1
    case n2 = 2
    case n3 = 3
}
