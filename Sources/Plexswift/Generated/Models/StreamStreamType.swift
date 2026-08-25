// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Stream type:
/// - VIDEO = 1 (Video stream)
/// - AUDIO = 2 (Audio stream)
/// - SUBTITLE = 3 (Subtitle stream)
public enum StreamStreamType: Int, Codable, Hashable, Sendable, CaseIterable {
    case n1 = 1
    case n2 = 2
    case n3 = 3
}
