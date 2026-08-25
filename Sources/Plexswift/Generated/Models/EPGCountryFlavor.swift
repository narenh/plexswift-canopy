// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// - `0`: The country is divided into regions, and following the key will lead to a list of regions.
/// - `1`: The county is divided by postal codes, and an example code is returned in `example`.
/// - `2`: The country has a single postal code, returned in `example`.
public enum EPGCountryFlavor: Int, Codable, Hashable, Sendable, CaseIterable {
    case n0 = 0
    case n1 = 1
    case n2 = 2
}
