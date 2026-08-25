import Foundation

/// An item as the Discover and metadata providers describe it: a movie, a show, a season, an
/// episode, a trailer, or a person.
///
/// This is Discover's counterpart to ``Metadata``, and deliberately a separate type. The two
/// describe different things — a media server's `Metadata` is about a file the account owns,
/// where this is about a title that exists, whether or not anyone owns it — and they differ in
/// what they carry: only this one has ``availability``, ``slug``, ``publicPagesURL`` and the
/// aggregator ``ratings``, and only `Metadata` has the file-level detail underneath it.
///
/// Every property is optional, and decoding never fails. The providers are undocumented and
/// change without announcement, so a field arriving as a quoted number, or an unfamiliar key
/// appearing beside the ones below, leaves the rest of the item intact. See
/// <doc:PlexDiscover> for what that costs and what it buys.
///
/// The `type` property is what distinguishes one kind of item from another: `movie`, `show`,
/// `season`, `episode`, `clip` and `person` all decode to this type, with a different subset
/// of the properties populated.
public struct DiscoverMetadata: Codable, Hashable, Sendable {

    // MARK: Identity

    /// The provider's key for the item, and the value to pass to
    /// ``DiscoverAPI/metadata(ratingKey:including:relatedCount:)``.
    ///
    /// Discover's keys are opaque hexadecimal strings such as `5d7768ba96b655001fdc0408`,
    /// unlike a media server's, which are small integers. A key from one provider is not
    /// meaningful to the other.
    public let ratingKey: String?
    /// The path at which the item itself can be fetched again.
    public let key: String?
    /// The item's canonical Plex identifier, as a `plex://movie/…` URI.
    public let guid: String?
    /// The identifier of the item this one was merged into, where the providers keep both.
    public let primaryGuid: String?
    /// The URL-safe name Discover uses in web addresses, such as `the-matrix-1999`.
    public let slug: String?
    /// The kind of item: `movie`, `show`, `season`, `episode`, `clip`, `person`.
    public let type: String?
    /// A narrower kind, where the provider distinguishes one — `trailer` on a clip.
    public let subtype: String?

    // MARK: Description

    /// The item's title.
    public let title: String?
    /// The title to sort by, when it differs — `Matrix, The`.
    public let titleSort: String?
    /// The title in the original language of production.
    public let originalTitle: String?
    /// The studio or network behind the item.
    public let studio: String?
    /// The age or content rating, such as `R` or `TV-MA`.
    public let contentRating: String?
    /// The synopsis.
    public let summary: String?
    /// The marketing tagline.
    public let tagline: String?
    /// The year of release.
    public let year: Int?
    /// The release date, as `YYYY-MM-DD`.
    public let originallyAvailableAt: String?
    /// The runtime in milliseconds.
    public let duration: Int?
    /// The page for the item on `watch.plex.tv`.
    public let publicPagesURL: String?
    /// Free-form flags the provider attaches to the item.
    public let attributes: String?

    // MARK: Artwork

    /// The poster path.
    public let thumb: String?
    /// The background artwork path.
    public let art: String?
    /// A wide banner, on a show.
    public let banner: String?
    /// The theme music path, on a show.
    public let theme: String?
    /// Artwork by role — `coverPoster`, `background`, `clearLogo`, `snapshot`.
    public let image: [DiscoverImage]?

    // MARK: Scores

    /// The critic score, out of 10.
    public let rating: Double?
    /// A URI naming the source of ``rating`` and the icon to show with it.
    public let ratingImage: String?
    /// The audience score, out of 10.
    public let audienceRating: Double?
    /// A URI naming the source of ``audienceRating``.
    public let audienceRatingImage: String?
    /// How many IMDb votes are behind the score.
    public let imdbRatingCount: Int?
    /// The individual scores that ``rating`` and ``audienceRating`` summarise.
    public let ratings: [DiscoverRating]?

    // MARK: Relations

    /// Genres.
    public let genre: [DiscoverTag]?
    /// Countries of production.
    public let country: [DiscoverTag]?
    /// Directors.
    public let director: [DiscoverTag]?
    /// Writers.
    public let writer: [DiscoverTag]?
    /// Producers.
    public let producer: [DiscoverTag]?
    /// Cast members, in credit order, with the character in ``DiscoverTag/role``.
    public let role: [DiscoverTag]?
    /// Titles the provider considers similar.
    public let similar: [DiscoverTag]?
    /// Collections the item belongs to.
    public let collection: [DiscoverTag]?
    /// Labels applied to the item.
    public let label: [DiscoverTag]?
    /// Moods, on music.
    public let mood: [DiscoverTag]?
    /// Identifiers for the item in external databases.
    public let guids: [DiscoverGuid]?
    /// Critics' reviews, when requested.
    public let reviews: [DiscoverReview]?
    /// Where the item can be streamed, rented or bought, when requested.
    public let availability: [DiscoverAvailability]?
    /// Playable streams, on a trailer or another extra.
    public let media: [DiscoverMedia]?
    /// Trailers, featurettes and interviews, when requested.
    public let extras: DiscoverItemsContainer?
    /// Hubs of related titles, when requested.
    public let related: DiscoverHubsContainer?
    /// The episode to play next, on a show, when requested.
    public let onDeck: DiscoverOnDeck?

    // MARK: Hierarchy

    /// The item's position among its siblings: the episode number, or the season number.
    public let index: Int?
    /// The parent's position — the season number, on an episode.
    public let parentIndex: Int?
    /// The parent's title — the season's, on an episode.
    public let parentTitle: String?
    /// The parent's key.
    public let parentRatingKey: String?
    /// The parent's Plex identifier.
    public let parentGuid: String?
    /// The path at which the parent can be fetched.
    public let parentKey: String?
    /// The parent's poster.
    public let parentThumb: String?
    /// The parent's background artwork.
    public let parentArt: String?
    /// The grandparent's title — the show's, on an episode.
    public let grandparentTitle: String?
    /// The grandparent's key.
    public let grandparentRatingKey: String?
    /// The grandparent's Plex identifier.
    public let grandparentGuid: String?
    /// The path at which the grandparent can be fetched.
    public let grandparentKey: String?
    /// The grandparent's poster.
    public let grandparentThumb: String?
    /// The grandparent's background artwork.
    public let grandparentArt: String?
    /// The grandparent's theme music.
    public let grandparentTheme: String?
    /// The grandparent's slug.
    public let grandparentSlug: String?
    /// How many episodes a show or season has.
    public let leafCount: Int?
    /// How many of them the account has watched.
    public let viewedLeafCount: Int?
    /// How many children the item has — seasons, on a show.
    public let childCount: Int?
    /// How many seasons a show has, where the provider counts them separately.
    public let seasonCount: Int?
    /// The child items, when children were requested.
    public let children: DiscoverItemsContainer?

    // MARK: Account state

    /// What the requesting account has done with the item, when requested.
    public let userState: DiscoverUserState?
    /// When the item was added to the account's watchlist, in seconds since the epoch.
    public let watchlistedAt: Int?
    /// How many times the account has watched it.
    public let viewCount: Int?
    /// How far into it playback last reached, in milliseconds.
    public let viewOffset: Int?
    /// When it was last watched, in seconds since the epoch.
    public let lastViewedAt: Int?
    /// The account's own rating, out of 10.
    public let userRating: Double?

    // MARK: Provenance

    /// When the item was added to the provider, in seconds since the epoch.
    public let addedAt: Int?
    /// When it was last changed, in seconds since the epoch.
    public let updatedAt: Int?
    /// When the item leaves the service it is currently on, in seconds since the epoch.
    public let expiresAt: Int?
    /// When the item becomes available, in seconds since the epoch.
    public let availableDate: Int?
    /// The key of the item's primary extra — usually its main trailer.
    public let primaryExtraKey: String?

    // MARK: Search

    /// Why this item was returned, on a search result — `section`, `originalTitle`, or the
    /// identifier of the hub the match came from.
    public let reason: String?
    /// The string that goes with ``reason``, ready to show.
    public let reasonTitle: String?
    /// The identifier of the item behind ``reason``.
    public let reasonID: String?
    /// How well the item matched, on a search result. Higher is better; the scale is the
    /// provider's own.
    public let score: Double?

    public init(
        ratingKey: String? = nil,
        key: String? = nil,
        guid: String? = nil,
        primaryGuid: String? = nil,
        slug: String? = nil,
        type: String? = nil,
        subtype: String? = nil,
        title: String? = nil,
        titleSort: String? = nil,
        originalTitle: String? = nil,
        studio: String? = nil,
        contentRating: String? = nil,
        summary: String? = nil,
        tagline: String? = nil,
        year: Int? = nil,
        originallyAvailableAt: String? = nil,
        duration: Int? = nil,
        publicPagesURL: String? = nil,
        attributes: String? = nil,
        thumb: String? = nil,
        art: String? = nil,
        banner: String? = nil,
        theme: String? = nil,
        image: [DiscoverImage]? = nil,
        rating: Double? = nil,
        ratingImage: String? = nil,
        audienceRating: Double? = nil,
        audienceRatingImage: String? = nil,
        imdbRatingCount: Int? = nil,
        ratings: [DiscoverRating]? = nil,
        genre: [DiscoverTag]? = nil,
        country: [DiscoverTag]? = nil,
        director: [DiscoverTag]? = nil,
        writer: [DiscoverTag]? = nil,
        producer: [DiscoverTag]? = nil,
        role: [DiscoverTag]? = nil,
        similar: [DiscoverTag]? = nil,
        collection: [DiscoverTag]? = nil,
        label: [DiscoverTag]? = nil,
        mood: [DiscoverTag]? = nil,
        guids: [DiscoverGuid]? = nil,
        reviews: [DiscoverReview]? = nil,
        availability: [DiscoverAvailability]? = nil,
        media: [DiscoverMedia]? = nil,
        extras: DiscoverItemsContainer? = nil,
        related: DiscoverHubsContainer? = nil,
        onDeck: DiscoverOnDeck? = nil,
        index: Int? = nil,
        parentIndex: Int? = nil,
        parentTitle: String? = nil,
        parentRatingKey: String? = nil,
        parentGuid: String? = nil,
        parentKey: String? = nil,
        parentThumb: String? = nil,
        parentArt: String? = nil,
        grandparentTitle: String? = nil,
        grandparentRatingKey: String? = nil,
        grandparentGuid: String? = nil,
        grandparentKey: String? = nil,
        grandparentThumb: String? = nil,
        grandparentArt: String? = nil,
        grandparentTheme: String? = nil,
        grandparentSlug: String? = nil,
        leafCount: Int? = nil,
        viewedLeafCount: Int? = nil,
        childCount: Int? = nil,
        seasonCount: Int? = nil,
        children: DiscoverItemsContainer? = nil,
        userState: DiscoverUserState? = nil,
        watchlistedAt: Int? = nil,
        viewCount: Int? = nil,
        viewOffset: Int? = nil,
        lastViewedAt: Int? = nil,
        userRating: Double? = nil,
        addedAt: Int? = nil,
        updatedAt: Int? = nil,
        expiresAt: Int? = nil,
        availableDate: Int? = nil,
        primaryExtraKey: String? = nil,
        reason: String? = nil,
        reasonTitle: String? = nil,
        reasonID: String? = nil,
        score: Double? = nil
    ) {
        self.ratingKey = ratingKey
        self.key = key
        self.guid = guid
        self.primaryGuid = primaryGuid
        self.slug = slug
        self.type = type
        self.subtype = subtype
        self.title = title
        self.titleSort = titleSort
        self.originalTitle = originalTitle
        self.studio = studio
        self.contentRating = contentRating
        self.summary = summary
        self.tagline = tagline
        self.year = year
        self.originallyAvailableAt = originallyAvailableAt
        self.duration = duration
        self.publicPagesURL = publicPagesURL
        self.attributes = attributes
        self.thumb = thumb
        self.art = art
        self.banner = banner
        self.theme = theme
        self.image = image
        self.rating = rating
        self.ratingImage = ratingImage
        self.audienceRating = audienceRating
        self.audienceRatingImage = audienceRatingImage
        self.imdbRatingCount = imdbRatingCount
        self.ratings = ratings
        self.genre = genre
        self.country = country
        self.director = director
        self.writer = writer
        self.producer = producer
        self.role = role
        self.similar = similar
        self.collection = collection
        self.label = label
        self.mood = mood
        self.guids = guids
        self.reviews = reviews
        self.availability = availability
        self.media = media
        self.extras = extras
        self.related = related
        self.onDeck = onDeck
        self.index = index
        self.parentIndex = parentIndex
        self.parentTitle = parentTitle
        self.parentRatingKey = parentRatingKey
        self.parentGuid = parentGuid
        self.parentKey = parentKey
        self.parentThumb = parentThumb
        self.parentArt = parentArt
        self.grandparentTitle = grandparentTitle
        self.grandparentRatingKey = grandparentRatingKey
        self.grandparentGuid = grandparentGuid
        self.grandparentKey = grandparentKey
        self.grandparentThumb = grandparentThumb
        self.grandparentArt = grandparentArt
        self.grandparentTheme = grandparentTheme
        self.grandparentSlug = grandparentSlug
        self.leafCount = leafCount
        self.viewedLeafCount = viewedLeafCount
        self.childCount = childCount
        self.seasonCount = seasonCount
        self.children = children
        self.userState = userState
        self.watchlistedAt = watchlistedAt
        self.viewCount = viewCount
        self.viewOffset = viewOffset
        self.lastViewedAt = lastViewedAt
        self.userRating = userRating
        self.addedAt = addedAt
        self.updatedAt = updatedAt
        self.expiresAt = expiresAt
        self.availableDate = availableDate
        self.primaryExtraKey = primaryExtraKey
        self.reason = reason
        self.reasonTitle = reasonTitle
        self.reasonID = reasonID
        self.score = score
    }

    private enum CodingKeys: String, CodingKey {
        case ratingKey, key, guid, primaryGuid, slug, type, subtype
        case title, titleSort, originalTitle, studio, contentRating, summary, tagline
        case year, originallyAvailableAt, duration, publicPagesURL, attributes
        case thumb, art, banner, theme
        case rating, ratingImage, audienceRating, audienceRatingImage, imdbRatingCount
        case index, parentIndex, parentTitle, parentRatingKey, parentGuid, parentKey
        case parentThumb, parentArt
        case grandparentTitle, grandparentRatingKey, grandparentGuid, grandparentKey
        case grandparentThumb, grandparentArt, grandparentTheme, grandparentSlug
        case leafCount, viewedLeafCount, childCount, seasonCount
        case watchlistedAt, viewCount, viewOffset, lastViewedAt, userRating
        case addedAt, updatedAt, expiresAt, availableDate, primaryExtraKey
        case reason, reasonTitle, reasonID, score
        case image = "Image"
        case genre = "Genre"
        case country = "Country"
        case director = "Director"
        case writer = "Writer"
        case producer = "Producer"
        case role = "Role"
        case similar = "Similar"
        case collection = "Collection"
        case label = "Label"
        case mood = "Mood"
        case ratings = "Rating"
        case guids = "Guid"
        case reviews = "Review"
        case availability = "Availability"
        case media = "Media"
        case extras = "Extras"
        case related = "Related"
        case onDeck = "OnDeck"
        case children = "Children"
        case userState = "UserState"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        ratingKey = values.discoverString(.ratingKey)
        key = values.discoverString(.key)
        guid = values.discoverString(.guid)
        primaryGuid = values.discoverString(.primaryGuid)
        slug = values.discoverString(.slug)
        type = values.discoverString(.type)
        subtype = values.discoverString(.subtype)

        title = values.discoverString(.title)
        titleSort = values.discoverString(.titleSort)
        originalTitle = values.discoverString(.originalTitle)
        studio = values.discoverString(.studio)
        contentRating = values.discoverString(.contentRating)
        summary = values.discoverString(.summary)
        tagline = values.discoverString(.tagline)
        year = values.discoverInt(.year)
        originallyAvailableAt = values.discoverString(.originallyAvailableAt)
        duration = values.discoverInt(.duration)
        publicPagesURL = values.discoverString(.publicPagesURL)
        attributes = values.discoverString(.attributes)

        thumb = values.discoverString(.thumb)
        art = values.discoverString(.art)
        banner = values.discoverString(.banner)
        theme = values.discoverString(.theme)
        image = values.discoverList(DiscoverImage.self, .image)

        rating = values.discoverDouble(.rating)
        ratingImage = values.discoverString(.ratingImage)
        audienceRating = values.discoverDouble(.audienceRating)
        audienceRatingImage = values.discoverString(.audienceRatingImage)
        imdbRatingCount = values.discoverInt(.imdbRatingCount)
        ratings = values.discoverList(DiscoverRating.self, .ratings)

        genre = values.discoverList(DiscoverTag.self, .genre)
        country = values.discoverList(DiscoverTag.self, .country)
        director = values.discoverList(DiscoverTag.self, .director)
        writer = values.discoverList(DiscoverTag.self, .writer)
        producer = values.discoverList(DiscoverTag.self, .producer)
        role = values.discoverList(DiscoverTag.self, .role)
        similar = values.discoverList(DiscoverTag.self, .similar)
        collection = values.discoverList(DiscoverTag.self, .collection)
        label = values.discoverList(DiscoverTag.self, .label)
        mood = values.discoverList(DiscoverTag.self, .mood)
        guids = values.discoverList(DiscoverGuid.self, .guids)
        reviews = values.discoverList(DiscoverReview.self, .reviews)
        availability = values.discoverList(DiscoverAvailability.self, .availability)
        media = values.discoverList(DiscoverMedia.self, .media)
        extras = values.discoverObject(DiscoverItemsContainer.self, .extras)
        related = values.discoverObject(DiscoverHubsContainer.self, .related)
        onDeck = values.discoverObject(DiscoverOnDeck.self, .onDeck)

        index = values.discoverInt(.index)
        parentIndex = values.discoverInt(.parentIndex)
        parentTitle = values.discoverString(.parentTitle)
        parentRatingKey = values.discoverString(.parentRatingKey)
        parentGuid = values.discoverString(.parentGuid)
        parentKey = values.discoverString(.parentKey)
        parentThumb = values.discoverString(.parentThumb)
        parentArt = values.discoverString(.parentArt)
        grandparentTitle = values.discoverString(.grandparentTitle)
        grandparentRatingKey = values.discoverString(.grandparentRatingKey)
        grandparentGuid = values.discoverString(.grandparentGuid)
        grandparentKey = values.discoverString(.grandparentKey)
        grandparentThumb = values.discoverString(.grandparentThumb)
        grandparentArt = values.discoverString(.grandparentArt)
        grandparentTheme = values.discoverString(.grandparentTheme)
        grandparentSlug = values.discoverString(.grandparentSlug)
        leafCount = values.discoverInt(.leafCount)
        viewedLeafCount = values.discoverInt(.viewedLeafCount)
        childCount = values.discoverInt(.childCount)
        seasonCount = values.discoverInt(.seasonCount)
        children = values.discoverObject(DiscoverItemsContainer.self, .children)

        userState = values.discoverObject(DiscoverUserState.self, .userState)
        watchlistedAt = values.discoverInt(.watchlistedAt)
        viewCount = values.discoverInt(.viewCount)
        viewOffset = values.discoverInt(.viewOffset)
        lastViewedAt = values.discoverInt(.lastViewedAt)
        userRating = values.discoverDouble(.userRating)

        addedAt = values.discoverInt(.addedAt)
        updatedAt = values.discoverInt(.updatedAt)
        expiresAt = values.discoverInt(.expiresAt)
        availableDate = values.discoverInt(.availableDate)
        primaryExtraKey = values.discoverString(.primaryExtraKey)

        reason = values.discoverString(.reason)
        reasonTitle = values.discoverString(.reasonTitle)
        reasonID = values.discoverString(.reasonID)
        score = values.discoverDouble(.score)
    }
}
