// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Display mode for the collection.
public enum CollectionCollectionMode: String, Codable, Hashable, Sendable, CaseIterable {
    case `default` = "default"
    case hideItems = "hideItems"
    case showItems = "showItems"
}
