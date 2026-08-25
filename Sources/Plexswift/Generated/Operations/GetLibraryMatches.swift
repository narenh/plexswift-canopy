// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

extension Operations {
    /// The matches endpoint is used to match content external to the library with content inside the
    /// library. This is done by passing a series of semantic "hints" about the content (its type, name,
    /// or release year). Each type (e.g. movie) has a canonical set of minimal required hints.
    /// This ability to match content is useful in a variety of scenarios. For example, in the DVR, the
    /// EPG uses the endpoint to match recording rules against airing content. And in the cloud, the UMP
    /// uses the endpoint to match up a piece of media with rich metadata.
    /// The endpoint response can including multiple matches, if there is ambiguity, each one containing
    /// a `score` from 0 to 100. For somewhat historical reasons, anything over 85 is considered a
    /// positive match (we prefer false negatives over false positives in general for matching).
    /// The `guid` hint is somewhat special, in that it generally represents a unique identity for a
    /// piece of media (e.g. the IMDB `ttXXX`) identifier, in contrast with other hints which can be
    /// much more ambiguous (e.g. a title of `Jane Eyre`, which could refer to the 1943 or the 2011
    /// version).
    /// Episodes require either a season/episode pair, or an air date (or both). Either the path must be
    /// sent, or the show title
    public struct GetLibraryMatches: PlexOperation {
        public typealias Success = MediaContainerWithMetadata

        public static let operationID = "getLibraryMatches"
        public static let method = HTTPMethod.get
        public static let host = OperationHost.mediaServer
        public static let requiresToken = true
        public static let requiresClientIdentifier = true

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
        public var type: MediaType?

        /// The title to filter by or assign
        public var title: String?

        /// Include full metadata in the response
        public var includeFullMetadata: BoolInt?

        /// Include ancestor metadata in the response
        public var includeAncestorMetadata: BoolInt?

        /// Include alternate metadata sources in the response
        public var includeAlternateMetadataSources: BoolInt?

        /// Used for movies, shows, artists, albums, and tracks. Allowed for various URI schemes, to be
        /// defined.
        public var guid: String?

        /// Used for movies shows, and albums. Optional.
        public var year: Int?

        /// Used for movies, episodes, and tracks. The full path to the media file, used for
        /// "cloud-scanning" an item.
        public var path2: String?

        /// Used for episodes and tracks. The title of the show/artist. Required if `path` isn't passed.
        public var grandparentTitle: String?

        /// Used for episodes. The year of the show.
        public var grandparentYear: Int?

        /// Used for episodes and tracks. The season/album number.
        public var parentIndex: Int?

        /// Used for episodes and tracks. The episode/tracks number in the season/album.
        public var index: Int?

        /// Used for episodes. In the format `YYYY-MM-DD`.
        public var originallyAvailableAt: String?

        /// Used for albums and tracks. The artist name for albums or the album name for tracks.
        public var parentTitle: String?

        public init(
            type: MediaType? = nil,
            title: String? = nil,
            includeFullMetadata: BoolInt? = nil,
            includeAncestorMetadata: BoolInt? = nil,
            includeAlternateMetadataSources: BoolInt? = nil,
            guid: String? = nil,
            year: Int? = nil,
            path2: String? = nil,
            grandparentTitle: String? = nil,
            grandparentYear: Int? = nil,
            parentIndex: Int? = nil,
            index: Int? = nil,
            originallyAvailableAt: String? = nil,
            parentTitle: String? = nil
        ) {
            self.type = type
            self.title = title
            self.includeFullMetadata = includeFullMetadata
            self.includeAncestorMetadata = includeAncestorMetadata
            self.includeAlternateMetadataSources = includeAlternateMetadataSources
            self.guid = guid
            self.year = year
            self.path2 = path2
            self.grandparentTitle = grandparentTitle
            self.grandparentYear = grandparentYear
            self.parentIndex = parentIndex
            self.index = index
            self.originallyAvailableAt = originallyAvailableAt
            self.parentTitle = parentTitle
        }

        public var path: String { "/library/matches" }

        public var queryItems: [URLQueryItem] {
            var items: [URLQueryItem] = []
            if let value = type {
                items.append(URLQueryItem(name: "type", value: QueryValue(value).encoded))
            }
            if let value = title {
                items.append(URLQueryItem(name: "title", value: QueryValue(value).encoded))
            }
            if let value = includeFullMetadata {
                items.append(URLQueryItem(name: "includeFullMetadata", value: QueryValue(value).encoded))
            }
            if let value = includeAncestorMetadata {
                items.append(URLQueryItem(name: "includeAncestorMetadata", value: QueryValue(value).encoded))
            }
            if let value = includeAlternateMetadataSources {
                items.append(URLQueryItem(name: "includeAlternateMetadataSources", value: QueryValue(value).encoded))
            }
            if let value = guid {
                items.append(URLQueryItem(name: "guid", value: QueryValue(value).encoded))
            }
            if let value = year {
                items.append(URLQueryItem(name: "year", value: QueryValue(value).encoded))
            }
            if let value = path2 {
                items.append(URLQueryItem(name: "path", value: QueryValue(value).encoded))
            }
            if let value = grandparentTitle {
                items.append(URLQueryItem(name: "grandparentTitle", value: QueryValue(value).encoded))
            }
            if let value = grandparentYear {
                items.append(URLQueryItem(name: "grandparentYear", value: QueryValue(value).encoded))
            }
            if let value = parentIndex {
                items.append(URLQueryItem(name: "parentIndex", value: QueryValue(value).encoded))
            }
            if let value = index {
                items.append(URLQueryItem(name: "index", value: QueryValue(value).encoded))
            }
            if let value = originallyAvailableAt {
                items.append(URLQueryItem(name: "originallyAvailableAt", value: QueryValue(value).encoded))
            }
            if let value = parentTitle {
                items.append(URLQueryItem(name: "parentTitle", value: QueryValue(value).encoded))
            }
            return items
        }
    }
}
