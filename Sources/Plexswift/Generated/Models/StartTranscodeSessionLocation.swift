// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum StartTranscodeSessionLocation: String, Codable, Hashable, Sendable, CaseIterable {
    case lan = "lan"
    case wan = "wan"
    case cellular = "cellular"
}
