// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The type of media content in the Plex library. This can represent videos, music, or photos.
public enum MediaTypeString: String, Codable, Hashable, Sendable, CaseIterable {
    case movie = "movie"
    case show = "show"
    case season = "season"
    case episode = "episode"
    case artist = "artist"
    case album = "album"
    case track = "track"
    case photoalbum = "photoalbum"
    case photo = "photo"
    case collection = "collection"
}
