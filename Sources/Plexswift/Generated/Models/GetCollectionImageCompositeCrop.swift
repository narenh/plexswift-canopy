// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Where to crop source images to fit into composite image proportions
public enum GetCollectionImageCompositeCrop: String, Codable, Hashable, Sendable, CaseIterable {
    case center = "center"
    case top = "top"
}
