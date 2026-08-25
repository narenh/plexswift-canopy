// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum StartTranscodeSessionTranscodeType: String, Codable, Hashable, Sendable, CaseIterable {
    case video = "video"
    case music = "music"
    case audio = "audio"
    case subtitles = "subtitles"
}
