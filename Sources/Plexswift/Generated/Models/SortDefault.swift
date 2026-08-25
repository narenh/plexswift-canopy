// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// If present, this sort is the default and in this direction
public enum SortDefault: String, Codable, Hashable, Sendable, CaseIterable {
    case asc = "asc"
    case desc = "desc"
}
