// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The protocol used for the connection (http, https, etc)
public enum PlexDeviceConnectionsItemProtocol: String, Codable, Hashable, Sendable, CaseIterable {
    case http = "http"
    case https = "https"
}
