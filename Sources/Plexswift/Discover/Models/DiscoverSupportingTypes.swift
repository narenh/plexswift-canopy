import Foundation

// The small types that hang off a `DiscoverMetadata`. Each decodes leniently — see
// `DiscoverDecoding.swift` — so an unexpected value leaves one property nil rather than
// failing the item it belongs to.

/// A piece of artwork attached to an item.
///
/// Discover returns artwork twice over: as the flat `thumb` and `art` paths the media server
/// also uses, and as this list, whose `url` is usually already absolute and whose `type` names
/// the role — `coverPoster`, `background`, `clearLogo`, `snapshot`.
public struct DiscoverImage: Codable, Hashable, Sendable {
    /// The role the image plays, such as `coverPoster` or `background`.
    public let type: String?
    /// The image's location. Usually an absolute URL on Plex's static host.
    public let url: String?
    /// Alternative text, when the provider supplies it.
    public let alt: String?

    public init(type: String? = nil, url: String? = nil, alt: String? = nil) {
        self.type = type
        self.url = url
        self.alt = alt
    }

    private enum CodingKeys: String, CodingKey {
        case type, url, alt
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = container.discoverString(.type)
        url = container.discoverString(.url)
        alt = container.discoverString(.alt)
    }
}

/// A named relation on an item: a genre, a director, a cast member, a country.
///
/// The same shape covers all of them. Which properties are populated depends on the relation —
/// `role` and `thumb` are a cast member's, `count` belongs to a faceted genre.
public struct DiscoverTag: Codable, Hashable, Sendable {
    /// The display name — the genre, the person's name, the country.
    public let tag: String?
    /// An opaque key identifying the tag on the provider, such as `tag://…` for a person.
    public let tagKey: String?
    /// The provider's numeric identifier for the tag, where it has one.
    public let id: String?
    /// The character played, for a cast member.
    public let role: String?
    /// A headshot or tag image.
    public let thumb: String?
    /// A URL-safe form of the tag, used in Discover's web paths.
    public let slug: String?
    /// The filter expression that reproduces this tag as a query.
    public let filter: String?
    /// The kind of tag, when the provider distinguishes them.
    public let type: String?
    /// How many items carry this tag, on a faceted list.
    public let count: Int?
    /// The position of a cast member in the credits.
    public let index: Int?

    public init(
        tag: String? = nil,
        tagKey: String? = nil,
        id: String? = nil,
        role: String? = nil,
        thumb: String? = nil,
        slug: String? = nil,
        filter: String? = nil,
        type: String? = nil,
        count: Int? = nil,
        index: Int? = nil
    ) {
        self.tag = tag
        self.tagKey = tagKey
        self.id = id
        self.role = role
        self.thumb = thumb
        self.slug = slug
        self.filter = filter
        self.type = type
        self.count = count
        self.index = index
    }

    private enum CodingKeys: String, CodingKey {
        case tag, tagKey, id, role, thumb, slug, filter, type, count, index
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tag = container.discoverString(.tag)
        tagKey = container.discoverString(.tagKey)
        id = container.discoverString(.id)
        role = container.discoverString(.role)
        thumb = container.discoverString(.thumb)
        slug = container.discoverString(.slug)
        filter = container.discoverString(.filter)
        type = container.discoverString(.type)
        count = container.discoverInt(.count)
        index = container.discoverInt(.index)
    }
}

/// A rating from a review aggregator.
///
/// An item usually carries several: a critic score and an audience score from Rotten Tomatoes,
/// an IMDb score, sometimes a TMDB one. `type` distinguishes `critic` from `audience`, and
/// `image` names the source — `rottentomatoes://image.rating.ripe`, `imdb://image.rating`.
public struct DiscoverRating: Codable, Hashable, Sendable {
    /// Which side of the aggregate this is: `critic` or `audience`.
    public let type: String?
    /// The score itself. The scale is the source's own — IMDb out of 10, Rotten Tomatoes out
    /// of 10 for the percentage divided by ten.
    public let value: Double?
    /// A URI naming the source and the icon to show with it.
    public let image: String?
    /// The number of votes behind the score, where the source reports it.
    public let count: Int?

    public init(type: String? = nil, value: Double? = nil, image: String? = nil, count: Int? = nil) {
        self.type = type
        self.value = value
        self.image = image
        self.count = count
    }

    private enum CodingKeys: String, CodingKey {
        case type, value, image, count
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = container.discoverString(.type)
        value = container.discoverDouble(.value)
        image = container.discoverString(.image)
        count = container.discoverInt(.count)
    }
}

/// An identifier for the item in an external database.
///
/// The `id` is a URI: `imdb://tt0133093`, `tmdb://603`, `tvdb://70327`. See
/// ``DiscoverMetadata/imdbID``, ``DiscoverMetadata/tmdbID`` and ``DiscoverMetadata/tvdbID``
/// for the parsed forms.
public struct DiscoverGuid: Codable, Hashable, Sendable {
    /// The identifier, as a `scheme://value` URI.
    public let id: String?

    public init(id: String? = nil) {
        self.id = id
    }

    private enum CodingKeys: String, CodingKey {
        case id
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = container.discoverString(.id)
    }

    /// The value of this identifier if it belongs to `service`, for example `tt0133093` for
    /// `imdb`.
    public func value(for service: String) -> String? {
        guard let id, id.hasPrefix(service + "://") else { return nil }
        return String(id.dropFirst(service.count + 3))
    }
}

/// A critic's review, returned when reviews are requested.
public struct DiscoverReview: Codable, Hashable, Sendable {
    /// The reviewer's name.
    public let tag: String?
    /// The publication the review appeared in.
    public let source: String?
    /// The pull quote.
    public let text: String?
    /// A link to the review in full.
    public let link: String?
    /// An image for the reviewer or the publication.
    public let image: String?
    /// The provider's identifier for the review.
    public let id: String?
    /// The filter expression that finds other reviews from the same source.
    public let filter: String?

    public init(
        tag: String? = nil,
        source: String? = nil,
        text: String? = nil,
        link: String? = nil,
        image: String? = nil,
        id: String? = nil,
        filter: String? = nil
    ) {
        self.tag = tag
        self.source = source
        self.text = text
        self.link = link
        self.image = image
        self.id = id
        self.filter = filter
    }

    private enum CodingKeys: String, CodingKey {
        case tag, source, text, link, image, id, filter
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        tag = container.discoverString(.tag)
        source = container.discoverString(.source)
        text = container.discoverString(.text)
        link = container.discoverString(.link)
        image = container.discoverString(.image)
        id = container.discoverString(.id)
        filter = container.discoverString(.filter)
    }
}

/// Somewhere the item can be streamed, rented or bought.
///
/// This is the part of Discover that has no equivalent on a media server: for a given title it
/// lists the services carrying it, with the offer type and, for a rental or purchase, the
/// price. It is populated when availability is requested — see
/// ``DiscoverMetadataInclusions/availability`` — and is region-specific, so the answer depends
/// on the account making the request.
public struct DiscoverAvailability: Codable, Hashable, Sendable {
    /// The provider's identifier for this offer.
    public let id: String?
    /// The service's display name, such as `Netflix`.
    public let title: String?
    /// The service's platform key, such as `netflix` or `appletv`.
    public let platform: String?
    /// A deep link into the service's own app, where it has one.
    public let platformUrl: String?
    /// A logo for the service, tinted for a dark background.
    public let platformColorThumb: String?
    /// The web address of the title on the service.
    public let url: String?
    /// How the title is offered: `subscription`, `rent`, `buy`, `ads`, `free`.
    public let offerType: String?
    /// A narrower form of ``offerType`` where the service distinguishes one.
    public let offerSubtype: String?
    /// The price as Plex renders it for display, currency symbol included.
    public let priceDescription: String?
    /// The price as a number, in the account's currency.
    public let price: Double?
    /// The quality of the offer, such as `hd` or `uhd`.
    public let quality: String?
    /// The video quality of the offer, where the service reports it separately.
    public let videoQuality: String?
    /// Free-form detail about the offer.
    public let offerDetails: String?
    /// When the title becomes available on the service, as a date string.
    public let availableDate: String?
    /// The start of the availability window, in seconds since the epoch.
    public let windowStart: Int?
    /// The end of the availability window, in seconds since the epoch — when the title is
    /// due to leave the service.
    public let windowEnd: Int?

    public init(
        id: String? = nil,
        title: String? = nil,
        platform: String? = nil,
        platformUrl: String? = nil,
        platformColorThumb: String? = nil,
        url: String? = nil,
        offerType: String? = nil,
        offerSubtype: String? = nil,
        priceDescription: String? = nil,
        price: Double? = nil,
        quality: String? = nil,
        videoQuality: String? = nil,
        offerDetails: String? = nil,
        availableDate: String? = nil,
        windowStart: Int? = nil,
        windowEnd: Int? = nil
    ) {
        self.id = id
        self.title = title
        self.platform = platform
        self.platformUrl = platformUrl
        self.platformColorThumb = platformColorThumb
        self.url = url
        self.offerType = offerType
        self.offerSubtype = offerSubtype
        self.priceDescription = priceDescription
        self.price = price
        self.quality = quality
        self.videoQuality = videoQuality
        self.offerDetails = offerDetails
        self.availableDate = availableDate
        self.windowStart = windowStart
        self.windowEnd = windowEnd
    }

    private enum CodingKeys: String, CodingKey {
        case id, title, platform, platformUrl, platformColorThumb, url
        case offerType, offerSubtype, priceDescription, price
        case quality, videoQuality, offerDetails, availableDate
        case windowStart, windowEnd
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = container.discoverString(.id)
        title = container.discoverString(.title)
        platform = container.discoverString(.platform)
        platformUrl = container.discoverString(.platformUrl)
        platformColorThumb = container.discoverString(.platformColorThumb)
        url = container.discoverString(.url)
        offerType = container.discoverString(.offerType)
        offerSubtype = container.discoverString(.offerSubtype)
        priceDescription = container.discoverString(.priceDescription)
        price = container.discoverDouble(.price)
        quality = container.discoverString(.quality)
        videoQuality = container.discoverString(.videoQuality)
        offerDetails = container.discoverString(.offerDetails)
        availableDate = container.discoverString(.availableDate)
        windowStart = container.discoverInt(.windowStart)
        windowEnd = container.discoverInt(.windowEnd)
    }
}

/// What the requesting account has done with an item: watched it, rated it, put it on a
/// watchlist.
///
/// Returned when `includeUserState` is asked for. Plex sends these fields inline on the item
/// as well as in this object, depending on the endpoint; ``DiscoverMetadata`` exposes both.
public struct DiscoverUserState: Codable, Hashable, Sendable {
    /// When the item was added to the watchlist, in seconds since the epoch.
    public let watchlistedAt: Int?
    /// How many times the account has watched it.
    public let viewCount: Int?
    /// How far into the item playback last reached, in milliseconds.
    public let viewOffset: Int?
    /// When it was last watched, in seconds since the epoch.
    public let lastViewedAt: Int?
    /// How many of a show's episodes the account has watched.
    public let viewedLeafCount: Int?
    /// The account's own rating, out of 10.
    public let userRating: Double?
    /// When the account last rated it, in seconds since the epoch.
    public let lastRatedAt: Int?

    public init(
        watchlistedAt: Int? = nil,
        viewCount: Int? = nil,
        viewOffset: Int? = nil,
        lastViewedAt: Int? = nil,
        viewedLeafCount: Int? = nil,
        userRating: Double? = nil,
        lastRatedAt: Int? = nil
    ) {
        self.watchlistedAt = watchlistedAt
        self.viewCount = viewCount
        self.viewOffset = viewOffset
        self.lastViewedAt = lastViewedAt
        self.viewedLeafCount = viewedLeafCount
        self.userRating = userRating
        self.lastRatedAt = lastRatedAt
    }

    private enum CodingKeys: String, CodingKey {
        case watchlistedAt, viewCount, viewOffset, lastViewedAt
        case viewedLeafCount, userRating, lastRatedAt
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        watchlistedAt = container.discoverInt(.watchlistedAt)
        viewCount = container.discoverInt(.viewCount)
        viewOffset = container.discoverInt(.viewOffset)
        lastViewedAt = container.discoverInt(.lastViewedAt)
        viewedLeafCount = container.discoverInt(.viewedLeafCount)
        userRating = container.discoverDouble(.userRating)
        lastRatedAt = container.discoverInt(.lastRatedAt)
    }
}

/// A playable stream attached to an item.
///
/// On Discover this is a trailer or another extra rather than the title itself: the providers
/// hold metadata, not media. ``DiscoverPart/key`` is the path to hand to a player.
public struct DiscoverMedia: Codable, Hashable, Sendable {
    /// The provider's identifier for this stream.
    public let id: String?
    /// The duration in milliseconds.
    public let duration: Int?
    /// The pixel width of the video.
    public let width: Int?
    /// The pixel height of the video.
    public let height: Int?
    /// The bitrate in kilobits per second.
    public let bitrate: Int?
    /// A shorthand for the vertical resolution, such as `1080` or `4k`.
    public let videoResolution: String?
    /// The container format, such as `mp4`.
    public let container: String?
    /// The video codec, such as `h264`.
    public let videoCodec: String?
    /// The audio codec, such as `aac`.
    public let audioCodec: String?
    /// The number of audio channels.
    public let audioChannels: Int?
    /// The frame rate, as Plex's shorthand — `24p`, `PAL`.
    public let videoFrameRate: String?
    /// Whether the stream is laid out for progressive download.
    public let optimizedForStreaming: Bool?
    /// The parts making up this stream.
    public let part: [DiscoverPart]?

    public init(
        id: String? = nil,
        duration: Int? = nil,
        width: Int? = nil,
        height: Int? = nil,
        bitrate: Int? = nil,
        videoResolution: String? = nil,
        container: String? = nil,
        videoCodec: String? = nil,
        audioCodec: String? = nil,
        audioChannels: Int? = nil,
        videoFrameRate: String? = nil,
        optimizedForStreaming: Bool? = nil,
        part: [DiscoverPart]? = nil
    ) {
        self.id = id
        self.duration = duration
        self.width = width
        self.height = height
        self.bitrate = bitrate
        self.videoResolution = videoResolution
        self.container = container
        self.videoCodec = videoCodec
        self.audioCodec = audioCodec
        self.audioChannels = audioChannels
        self.videoFrameRate = videoFrameRate
        self.optimizedForStreaming = optimizedForStreaming
        self.part = part
    }

    private enum CodingKeys: String, CodingKey {
        case id, duration, width, height, bitrate, videoResolution, container
        case videoCodec, audioCodec, audioChannels, videoFrameRate, optimizedForStreaming
        case part = "Part"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = values.discoverString(.id)
        duration = values.discoverInt(.duration)
        width = values.discoverInt(.width)
        height = values.discoverInt(.height)
        bitrate = values.discoverInt(.bitrate)
        videoResolution = values.discoverString(.videoResolution)
        container = values.discoverString(.container)
        videoCodec = values.discoverString(.videoCodec)
        audioCodec = values.discoverString(.audioCodec)
        audioChannels = values.discoverInt(.audioChannels)
        videoFrameRate = values.discoverString(.videoFrameRate)
        optimizedForStreaming = values.discoverBool(.optimizedForStreaming)
        part = values.discoverList(DiscoverPart.self, .part)
    }
}

/// One file of a ``DiscoverMedia`` stream.
public struct DiscoverPart: Codable, Hashable, Sendable {
    /// The provider's identifier for this part.
    public let id: String?
    /// The path to play, relative to the provider that returned it.
    public let key: String?
    /// The duration in milliseconds.
    public let duration: Int?
    /// The container format.
    public let container: String?
    /// The size in bytes, where the provider reports one.
    public let size: Int?

    public init(
        id: String? = nil,
        key: String? = nil,
        duration: Int? = nil,
        container: String? = nil,
        size: Int? = nil
    ) {
        self.id = id
        self.key = key
        self.duration = duration
        self.container = container
        self.size = size
    }

    private enum CodingKeys: String, CodingKey {
        case id, key, duration, container, size
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = values.discoverString(.id)
        key = values.discoverString(.key)
        duration = values.discoverInt(.duration)
        container = values.discoverString(.container)
        size = values.discoverInt(.size)
    }
}
