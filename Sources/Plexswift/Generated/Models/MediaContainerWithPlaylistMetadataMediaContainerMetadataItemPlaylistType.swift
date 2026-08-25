// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// The type of the playlist.
public enum MediaContainerWithPlaylistMetadataMediaContainerMetadataItemPlaylistType: String, Codable, Hashable, Sendable, CaseIterable {
    case audio = "audio"
    case video = "video"
    case photo = "photo"
}
