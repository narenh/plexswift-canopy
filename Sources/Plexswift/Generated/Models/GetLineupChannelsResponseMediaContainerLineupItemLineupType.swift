// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// - `-1`: N/A
/// - `0`: Over the air
/// - `1`: Cable
/// - `2`: Satellite
/// - `3`: IPTV
/// - `4`: Virtual
public enum GetLineupChannelsResponseMediaContainerLineupItemLineupType: Int, Codable, Hashable, Sendable, CaseIterable {
    case nMinus1 = -1
    case n0 = 0
    case n1 = 1
    case n2 = 2
    case n3 = 3
    case n4 = 4
}
