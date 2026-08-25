// Generated from Spec/plex-api-spec.yaml by Tools/generate.py. Do not edit.
//
// Run `python Tools/generate.py` after changing the specification.

import Foundation

/// Items in a library are referred to as "metadata items." These metadata items are distinct from
/// "media items" which represent actual instances of media that can be consumed. Consider a TV
/// library that has a single video file in it for a particular episode of a show. The library has a
/// single media item, but it has three metadata items: one for the show, one for the season, and
/// one for the episode. Consider a movie library that has two video files in it: the same movie,
/// but two different resolutions. The library has a single metadata item for the movie, but that
/// metadata item has two media items, one for each resolution. Additionally a "media item" will
/// have one or more "media parts" where the the parts are intended to be watched together, such as
/// a CD1 and CD2 parts of the same movie.
///
/// Note that when a metadata item has multiple media items, those media items should be isomorphic.
/// That is, a 4K version and 1080p version of a movie are different versions of the same movie.
/// They have the same duration, same summary, same rating, etc. and they can generally be
/// considered interchangeable. A theatrical release vs. director's cut vs. unrated version on the
/// other hand would be separate metadata items.
///
/// Metadata items can often live in a hierarchy with relationships between them. For example, the
/// metadata item for an episodes is associated with a season metadata item which is associated with
/// a show metadata item. A similar hierarchy exists with track, album, and artist and photos and
/// photo album. The relationships may be expressed via relative terms and absolute terms. For
/// example, "leaves" refer to metadata items which has associated media (there is no media for a
/// season nor show). A show will have "children" in the form of seasons and a season will have
/// "children" in the form of episodes and episodes have "parent" in the form of a season which has
/// a "parent" in the form of a show. Similarly, a show has "grandchildren" in the form of episodse
/// and an episode has a "grandparent" in the form of a show.
public struct MediaContainerWithPlaylistMetadataMediaContainerMetadataItem: Codable, Hashable, Sendable {
    /// If we return this as true then this playlist cannot be altered or deleted directly by the
    /// client.
    public let readOnly: Bool?

    /// When present, the URL for a composite image for descendent items (e.g. photo albums or
    /// playlists).
    public let composite: String?

    /// When present, the duration for the item, in units of milliseconds.
    public let duration: Int?

    /// Total duration in seconds (redundant but present in XML).
    public let durationInSeconds: Int?

    /// The key at which the item's details can be fetched. In many cases a metadata item may be passed
    /// without all the details (such as in a hub) and this key corresponds to the endpoint to fetch
    /// additional details.
    public let key: String?

    /// For shows and seasons, contains the number of total episodes.
    public let leafCount: Int?

    /// The type of the playlist.
    public let playlistType: MediaContainerWithPlaylistMetadataMediaContainerMetadataItemPlaylistType?

    /// Whether this is a generated radio playlist.
    public let radio: Bool?

    /// Whether or not the playlist is smart.
    public let smart: Bool?

    /// If this is a special playlist, this returns its type (e.g. favorites).
    public let specialPlaylistType: String?

    /// The title of the item (e.g. “300” or “The Simpsons”)
    public let title: String?

    /// The type of the video item, such as `movie`, `episode`, or `clip`.
    public let type: String?

    /// When present, contains the disc number for a track on multi-disc albums.
    public let absoluteIndex: Int?

    /// In units of seconds since the epoch, returns the time at which the item was added to the
    /// library.
    public let addedAt: Int?

    /// When present, the URL for the background artwork for the item.
    public let art: String?

    /// Blur hash for background art.
    public let artBlurHash: String?

    /// Some rating systems separate reviewer ratings from audience ratings
    public let audienceRating: Double?

    /// A URI representing the image to be shown with the audience rating (e.g.
    /// rottentomatoes://image.rating.spilled).
    public let audienceRatingImage: String?

    public let autotag: [Tag]?

    /// When present, the URL for a banner graphic for the item.
    public let banner: String?

    /// When present, indicates the source for the chapters in the media file. Can be media (the
    /// chapters were embedded in the media itself), agent (a metadata agent computed them), or mixed (a
    /// combination of the two).
    public let chapterSource: String?

    /// The number of child items associated with this media item.
    public let childCount: Int?

    /// If known, the content rating (e.g. MPAA) for an item.
    public let contentRating: String?

    public let country: [Tag]?

    public let director: [Tag]?

    /// Levenshtein distance for voice search results.
    public let distance: Int?

    /// Edition string (e.g. "Director's Cut").
    public let editionTitle: String?

    /// Whether credits marker generation is enabled for this item.
    public let enableCreditsMarkerGeneration: Bool?

    /// Typically only seen in metadata at a library's top level
    public let filter: [Filter]?

    public let genre: [Tag]?

    /// The `art` of the grandparent
    public let grandparentArt: String?

    /// The GUID of the grandparent media item.
    public let grandparentGuid: String?

    /// The `hero` of the grandparent
    public let grandparentHero: String?

    /// The `key` of the grandparent
    public let grandparentKey: String?

    /// The `ratingKey` of the grandparent
    public let grandparentRatingKey: String?

    /// The `theme` of the grandparent
    public let grandparentTheme: String?

    /// The `thumb` of the grandparent
    public let grandparentThumb: String?

    /// The `title` of the grandparent
    public let grandparentTitle: String?

    /// The globally unique identifier for the media item.
    public let guid: String?

    public let guid2: [MediaContainerWithPlaylistMetadataMediaContainerMetadataItemGuidItem]?

    /// When present, the URL for a hero image for the item.
    public let hero: String?

    public let image: [Image]?

    /// When present, this represents the episode number for episodes, season number for seasons, or
    /// track number for audio tracks.
    public let index: Int?

    /// Per-item language override.
    public let languageOverride: String?

    /// Timestamp of the last user rating.
    public let lastRatedAt: Int?

    /// When a user has watched or listened to an item, this contains a timestamp (epoch seconds) for
    /// that last consumption time.
    public let lastViewedAt: Int?

    public let media: [Media]?

    /// Analysis version for music items.
    public let musicAnalysisVersion: Int?

    /// When present, in the format YYYY-MM-DD [HH:MM:SS] (the hours/minutes/seconds part is not always
    /// present). The air date, or a higher resolution release date for an item, depending on type. For
    /// example, episodes usually have air date like 1979-08-10 (we don't use epoch seconds because
    /// media existed prior to 1970). In some cases, recorded over-the-air content has higher resolution
    /// air date which includes a time component. Albums and movies may have day-resolution release
    /// dates as well.
    public let originallyAvailableAt: String?

    /// When present, used to indicate an item's original title, e.g. a movie's foreign title.
    public let originalTitle: String?

    /// The GUID of the parent media item.
    public let parentGuid: String?

    /// The `hero` of the parent
    public let parentHero: String?

    /// The `index` of the parent
    public let parentIndex: Int?

    /// The `key` of the parent
    public let parentKey: String?

    /// The `ratingKey` of the parent
    public let parentRatingKey: String?

    /// The `thumb` of the parent
    public let parentThumb: String?

    /// The `title` of the parent
    public let parentTitle: String?

    /// Item ID within a playlist.
    public let playlistItemID: Int?

    /// Indicates that the item has a primary extra; for a movie, this is a trailer, and for a music
    /// track it is a music video. The URL points to the metadata details endpoint for the item.
    public let primaryExtraKey: String?

    /// Prompt to give the user for this directory (such as `Search Movies`)
    public let prompt: String?

    /// When present, the rating for the item. The exact meaning and representation depends on where the
    /// rating was sourced from.
    public let rating: Double?

    public let rating2: [Tag]?

    /// Number of ratings under this metadata
    public let ratingCount: Int?

    /// When present, indicates an image to be shown with the rating. This is passed back as a small set
    /// of defined URI values, e.g. rottentomatoes://image.rating.rotten.
    public let ratingImage: String?

    /// This is the opaque string to be passed into timeline, scrobble, and rating endpoints to identify
    /// them. While it often appears to be numeric, this is not guaranteed.
    public let ratingKey: String?

    public let role: [Tag]?

    /// Indicates this is a search directory
    public let search: Bool?

    /// Used by old clients to provide nested menus allowing for primative (but structured) navigation.
    public let secondary: Bool?

    /// When found on a show item, indicates that the children (seasons) should be skipped in favor of
    /// the grandchildren (episodes). Useful for mini-series, etc.
    public let skipChildren: MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildren?

    /// Number of times this track has been skipped.
    public let skipCount: Int?

    /// When present on an episode or track item, indicates parent should be skipped in favor of
    /// grandparent (show).
    public let skipParent: MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipParent?

    /// URL-friendly slug for the item.
    public let slug: String?

    /// Typically only seen in metadata at a library's top level
    public let sort: [Sort]?

    /// Remote or shared server item URI.
    public let sourceURI: String?

    /// When present, the studio or label which produced an item (e.g. movie studio for movies, record
    /// label for albums).
    public let studio: String?

    /// The subtype of the video item, such as `photo` when the video item is in a photo library
    public let subtype: String?

    /// When present, the extended textual information about the item (e.g. movie plot, artist
    /// biography, album review).
    public let summary: String?

    /// When present, a pithy one-liner about the item (usually only seen for movies).
    public let tagline: String?

    /// When present, the URL for theme music for the item (usually only for TV shows).
    public let theme: String?

    /// When present, the URL for the poster or thumbnail for the item. When available for types like
    /// movie, it will be the poster graphic, but fall-back to the extracted media thumbnail.
    public let thumb: String?

    /// Blur hash for thumbnail.
    public let thumbBlurHash: String?

    /// Whene present, this is the string used for sorting the item. It's usually the title with any
    /// leading articles removed (e.g. “Simpsons”).
    public let titleSort: String?

    /// In units of seconds since the epoch, returns the time at which the item was last changed (e.g.
    /// had its metadata updated).
    public let updatedAt: Int?

    /// Whether to display the original title.
    public let useOriginalTitle: Bool?

    /// When the user has rated an item, this contains the user rating
    public let userRating: Double?

    /// When a users has completed watched or listened to an item, this attribute contains the number of
    /// consumptions.
    public let viewCount: Int?

    /// For shows and seasons, contains the number of viewed episodes.
    public let viewedLeafCount: Int?

    /// When a user is in the process of viewing or listening to this item, this attribute contains the
    /// current offset, in units of milliseconds.
    public let viewOffset: Int?

    public let writer: [Tag]?

    /// When present, the year associated with the item's release (e.g. release year for a movie).
    public let year: Int?

    public init(
        readOnly: Bool? = nil,
        composite: String? = nil,
        duration: Int? = nil,
        durationInSeconds: Int? = nil,
        key: String? = nil,
        leafCount: Int? = nil,
        playlistType: MediaContainerWithPlaylistMetadataMediaContainerMetadataItemPlaylistType? = nil,
        radio: Bool? = nil,
        smart: Bool? = nil,
        specialPlaylistType: String? = nil,
        title: String? = nil,
        type: String? = nil,
        absoluteIndex: Int? = nil,
        addedAt: Int? = nil,
        art: String? = nil,
        artBlurHash: String? = nil,
        audienceRating: Double? = nil,
        audienceRatingImage: String? = nil,
        autotag: [Tag]? = nil,
        banner: String? = nil,
        chapterSource: String? = nil,
        childCount: Int? = nil,
        contentRating: String? = nil,
        country: [Tag]? = nil,
        director: [Tag]? = nil,
        distance: Int? = nil,
        editionTitle: String? = nil,
        enableCreditsMarkerGeneration: Bool? = nil,
        filter: [Filter]? = nil,
        genre: [Tag]? = nil,
        grandparentArt: String? = nil,
        grandparentGuid: String? = nil,
        grandparentHero: String? = nil,
        grandparentKey: String? = nil,
        grandparentRatingKey: String? = nil,
        grandparentTheme: String? = nil,
        grandparentThumb: String? = nil,
        grandparentTitle: String? = nil,
        guid: String? = nil,
        guid2: [MediaContainerWithPlaylistMetadataMediaContainerMetadataItemGuidItem]? = nil,
        hero: String? = nil,
        image: [Image]? = nil,
        index: Int? = nil,
        languageOverride: String? = nil,
        lastRatedAt: Int? = nil,
        lastViewedAt: Int? = nil,
        media: [Media]? = nil,
        musicAnalysisVersion: Int? = nil,
        originallyAvailableAt: String? = nil,
        originalTitle: String? = nil,
        parentGuid: String? = nil,
        parentHero: String? = nil,
        parentIndex: Int? = nil,
        parentKey: String? = nil,
        parentRatingKey: String? = nil,
        parentThumb: String? = nil,
        parentTitle: String? = nil,
        playlistItemID: Int? = nil,
        primaryExtraKey: String? = nil,
        prompt: String? = nil,
        rating: Double? = nil,
        rating2: [Tag]? = nil,
        ratingCount: Int? = nil,
        ratingImage: String? = nil,
        ratingKey: String? = nil,
        role: [Tag]? = nil,
        search: Bool? = nil,
        secondary: Bool? = nil,
        skipChildren: MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipChildren? = nil,
        skipCount: Int? = nil,
        skipParent: MediaContainerWithPlaylistMetadataMediaContainerMetadataItemSkipParent? = nil,
        slug: String? = nil,
        sort: [Sort]? = nil,
        sourceURI: String? = nil,
        studio: String? = nil,
        subtype: String? = nil,
        summary: String? = nil,
        tagline: String? = nil,
        theme: String? = nil,
        thumb: String? = nil,
        thumbBlurHash: String? = nil,
        titleSort: String? = nil,
        updatedAt: Int? = nil,
        useOriginalTitle: Bool? = nil,
        userRating: Double? = nil,
        viewCount: Int? = nil,
        viewedLeafCount: Int? = nil,
        viewOffset: Int? = nil,
        writer: [Tag]? = nil,
        year: Int? = nil
    ) {
        self.readOnly = readOnly
        self.composite = composite
        self.duration = duration
        self.durationInSeconds = durationInSeconds
        self.key = key
        self.leafCount = leafCount
        self.playlistType = playlistType
        self.radio = radio
        self.smart = smart
        self.specialPlaylistType = specialPlaylistType
        self.title = title
        self.type = type
        self.absoluteIndex = absoluteIndex
        self.addedAt = addedAt
        self.art = art
        self.artBlurHash = artBlurHash
        self.audienceRating = audienceRating
        self.audienceRatingImage = audienceRatingImage
        self.autotag = autotag
        self.banner = banner
        self.chapterSource = chapterSource
        self.childCount = childCount
        self.contentRating = contentRating
        self.country = country
        self.director = director
        self.distance = distance
        self.editionTitle = editionTitle
        self.enableCreditsMarkerGeneration = enableCreditsMarkerGeneration
        self.filter = filter
        self.genre = genre
        self.grandparentArt = grandparentArt
        self.grandparentGuid = grandparentGuid
        self.grandparentHero = grandparentHero
        self.grandparentKey = grandparentKey
        self.grandparentRatingKey = grandparentRatingKey
        self.grandparentTheme = grandparentTheme
        self.grandparentThumb = grandparentThumb
        self.grandparentTitle = grandparentTitle
        self.guid = guid
        self.guid2 = guid2
        self.hero = hero
        self.image = image
        self.index = index
        self.languageOverride = languageOverride
        self.lastRatedAt = lastRatedAt
        self.lastViewedAt = lastViewedAt
        self.media = media
        self.musicAnalysisVersion = musicAnalysisVersion
        self.originallyAvailableAt = originallyAvailableAt
        self.originalTitle = originalTitle
        self.parentGuid = parentGuid
        self.parentHero = parentHero
        self.parentIndex = parentIndex
        self.parentKey = parentKey
        self.parentRatingKey = parentRatingKey
        self.parentThumb = parentThumb
        self.parentTitle = parentTitle
        self.playlistItemID = playlistItemID
        self.primaryExtraKey = primaryExtraKey
        self.prompt = prompt
        self.rating = rating
        self.rating2 = rating2
        self.ratingCount = ratingCount
        self.ratingImage = ratingImage
        self.ratingKey = ratingKey
        self.role = role
        self.search = search
        self.secondary = secondary
        self.skipChildren = skipChildren
        self.skipCount = skipCount
        self.skipParent = skipParent
        self.slug = slug
        self.sort = sort
        self.sourceURI = sourceURI
        self.studio = studio
        self.subtype = subtype
        self.summary = summary
        self.tagline = tagline
        self.theme = theme
        self.thumb = thumb
        self.thumbBlurHash = thumbBlurHash
        self.titleSort = titleSort
        self.updatedAt = updatedAt
        self.useOriginalTitle = useOriginalTitle
        self.userRating = userRating
        self.viewCount = viewCount
        self.viewedLeafCount = viewedLeafCount
        self.viewOffset = viewOffset
        self.writer = writer
        self.year = year
    }

    private enum CodingKeys: String, CodingKey {
        case readOnly
        case composite
        case duration
        case durationInSeconds
        case key
        case leafCount
        case playlistType
        case radio
        case smart
        case specialPlaylistType
        case title
        case type
        case absoluteIndex
        case addedAt
        case art
        case artBlurHash
        case audienceRating
        case audienceRatingImage
        case autotag = "Autotag"
        case banner
        case chapterSource
        case childCount
        case contentRating
        case country = "Country"
        case director = "Director"
        case distance
        case editionTitle
        case enableCreditsMarkerGeneration
        case filter = "Filter"
        case genre = "Genre"
        case grandparentArt
        case grandparentGuid
        case grandparentHero
        case grandparentKey
        case grandparentRatingKey
        case grandparentTheme
        case grandparentThumb
        case grandparentTitle
        case guid
        case guid2 = "Guid"
        case hero
        case image = "Image"
        case index
        case languageOverride
        case lastRatedAt
        case lastViewedAt
        case media = "Media"
        case musicAnalysisVersion
        case originallyAvailableAt
        case originalTitle
        case parentGuid
        case parentHero
        case parentIndex
        case parentKey
        case parentRatingKey
        case parentThumb
        case parentTitle
        case playlistItemID
        case primaryExtraKey
        case prompt
        case rating
        case rating2 = "Rating"
        case ratingCount
        case ratingImage
        case ratingKey
        case role = "Role"
        case search
        case secondary
        case skipChildren
        case skipCount
        case skipParent
        case slug
        case sort = "Sort"
        case sourceURI
        case studio
        case subtype
        case summary
        case tagline
        case theme
        case thumb
        case thumbBlurHash
        case titleSort
        case updatedAt
        case useOriginalTitle
        case userRating
        case viewCount
        case viewedLeafCount
        case viewOffset
        case writer = "Writer"
        case year
    }
}
