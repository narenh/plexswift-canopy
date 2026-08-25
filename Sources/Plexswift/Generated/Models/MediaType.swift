// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The type of media to retrieve or filter by.
///
/// 1 = movie
/// 2 = show
/// 3 = season
/// 4 = episode
/// 5 = artist
/// 6 = album
/// 7 = track
/// 8 = photo_album
/// 9 = photo
///
/// E.g. A movie library will not return anything with type 3 as there are no seasons for movie
/// libraries
public enum MediaType: Int, Codable, Hashable, Sendable, CaseIterable {
    case n1 = 1
    case n2 = 2
    case n3 = 3
    case n4 = 4
    case n5 = 5
    case n6 = 6
    case n7 = 7
    case n8 = 8
    case n9 = 9
}
