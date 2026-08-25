// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum StartTranscodeSessionExtension: String, Codable, Hashable, Sendable, CaseIterable {
    case m3u8 = "m3u8"
    case mpd = "mpd"
}
