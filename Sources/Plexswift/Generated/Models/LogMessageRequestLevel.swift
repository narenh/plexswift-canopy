// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Log level (DEBUG, INFO, WARN, ERROR)
public enum LogMessageRequestLevel: String, Codable, Hashable, Sendable, CaseIterable {
    case debug = "DEBUG"
    case info = "INFO"
    case warn = "WARN"
    case error = "ERROR"
}
