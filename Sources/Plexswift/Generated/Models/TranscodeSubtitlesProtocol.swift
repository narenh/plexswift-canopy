// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum TranscodeSubtitlesProtocol: String, Codable, Hashable, Sendable, CaseIterable {
    case http = "http"
    case hls = "hls"
    case dash = "dash"
}
