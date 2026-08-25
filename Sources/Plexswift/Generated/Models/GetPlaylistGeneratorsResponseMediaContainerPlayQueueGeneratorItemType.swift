// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The type of playlist generator.
///
/// - -1: A smart playlist generator
/// - 42: A optimized version generator
public enum GetPlaylistGeneratorsResponseMediaContainerPlayQueueGeneratorItemType: Int, Codable, Hashable, Sendable, CaseIterable {
    case nMinus1 = -1
    case n42 = 42
}
