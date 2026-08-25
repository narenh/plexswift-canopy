// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The type of the value of this setting
public enum SettingType: String, Codable, Hashable, Sendable, CaseIterable {
    case bool = "bool"
    case int = "int"
    case text = "text"
    case double = "double"
}
