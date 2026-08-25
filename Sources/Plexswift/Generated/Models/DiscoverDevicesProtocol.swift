// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

public enum DiscoverDevicesProtocol: String, Codable, Hashable, Sendable, CaseIterable {
    case stream = "stream"
    case download = "download"
    case livetv = "livetv"
}
