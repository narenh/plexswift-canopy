// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The audio accessibility mode (0 = Prefer non-accessibility audio, 1 = Prefer accessibility
/// audio, 2 = Only show accessibility audio, 3 = Only show non-accessibility audio)
public enum UserProfileDefaultAudioAccessibility: Int, Codable, Hashable, Sendable, CaseIterable {
    case n0 = 0
    case n1 = 1
    case n2 = 2
    case n3 = 3
}
