// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The location of the client
public enum SessionLocation: String, Codable, Hashable, Sendable, CaseIterable {
    case lan = "lan"
    case wan = "wan"
}
