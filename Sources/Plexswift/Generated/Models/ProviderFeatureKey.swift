// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Feature key identifier.
public enum ProviderFeatureKey: String, Codable, Hashable, Sendable, CaseIterable {
    case search = "search"
    case metadata = "metadata"
    case content = "content"
    case match = "match"
    case manage = "manage"
    case timeline = "timeline"
    case rate = "rate"
    case playqueue = "playqueue"
    case playlist = "playlist"
    case subscribe = "subscribe"
    case promoted = "promoted"
    case continuewatching = "continuewatching"
    case collection = "collection"
    case actions = "actions"
    case imagetranscoder = "imagetranscoder"
    case queryParser = "queryParser"
    case grid = "grid"
}
