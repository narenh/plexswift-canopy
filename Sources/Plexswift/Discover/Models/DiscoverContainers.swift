import Foundation

// The envelopes the providers wrap their payloads in. Each response is
// `{"MediaContainer": {…}}`, as everywhere else in Plex; what differs is what the container
// holds — items, hubs, or grouped search results.

// MARK: - Items

/// A response whose container holds items.
///
/// Returned by the hub, directory, children, metadata and watchlist endpoints. The contents
/// are ``DiscoverItemsContainer/metadata`` on the container.
public struct DiscoverItemsResponse: Codable, Hashable, Sendable {
    /// The container, absent if the provider returned an empty body.
    public let mediaContainer: DiscoverItemsContainer?

    public init(mediaContainer: DiscoverItemsContainer? = nil) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mediaContainer = values.discoverObject(DiscoverItemsContainer.self, .mediaContainer)
    }
}

/// A container of items, with the paging counts that go with it.
public struct DiscoverItemsContainer: Codable, Hashable, Sendable {
    /// How many items this response carries.
    public let size: Int?
    /// How many exist in total, when the provider pages the result.
    public let totalSize: Int?
    /// Where this page starts.
    public let offset: Int?
    /// The provider that answered, such as `tv.plex.provider.discover`.
    public let identifier: String?
    /// A title for the container, on an endpoint that names its result.
    public let title: String?
    /// The section the items came from, on the watchlist and library endpoints.
    public let librarySectionID: String?
    /// The section's title.
    public let librarySectionTitle: String?
    /// The items.
    public let metadata: [DiscoverMetadata]?
    /// Directories, on an endpoint that returns a list of places rather than items.
    public let directory: [DiscoverDirectory]?

    public init(
        size: Int? = nil,
        totalSize: Int? = nil,
        offset: Int? = nil,
        identifier: String? = nil,
        title: String? = nil,
        librarySectionID: String? = nil,
        librarySectionTitle: String? = nil,
        metadata: [DiscoverMetadata]? = nil,
        directory: [DiscoverDirectory]? = nil
    ) {
        self.size = size
        self.totalSize = totalSize
        self.offset = offset
        self.identifier = identifier
        self.title = title
        self.librarySectionID = librarySectionID
        self.librarySectionTitle = librarySectionTitle
        self.metadata = metadata
        self.directory = directory
    }

    private enum CodingKeys: String, CodingKey {
        case size, totalSize, offset, identifier, title
        case librarySectionID, librarySectionTitle
        case metadata = "Metadata"
        case directory = "Directory"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        size = values.discoverInt(.size)
        totalSize = values.discoverInt(.totalSize)
        offset = values.discoverInt(.offset)
        identifier = values.discoverString(.identifier)
        title = values.discoverString(.title)
        librarySectionID = values.discoverString(.librarySectionID)
        librarySectionTitle = values.discoverString(.librarySectionTitle)
        metadata = values.discoverList(DiscoverMetadata.self, .metadata)
        directory = values.discoverList(DiscoverDirectory.self, .directory)
    }
}

// MARK: - Hubs

/// A response whose container holds hubs.
///
/// Returned by `/hubs` and by any hub key that groups its contents into further rows. The rows
/// are ``DiscoverHubsContainer/hub`` on the container.
public struct DiscoverHubsResponse: Codable, Hashable, Sendable {
    /// The container, absent if the provider returned an empty body.
    public let mediaContainer: DiscoverHubsContainer?

    public init(mediaContainer: DiscoverHubsContainer? = nil) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mediaContainer = values.discoverObject(DiscoverHubsContainer.self, .mediaContainer)
    }
}

/// A container of hubs.
public struct DiscoverHubsContainer: Codable, Hashable, Sendable {
    /// How many hubs this response carries.
    public let size: Int?
    /// The provider that answered.
    public let identifier: String?
    /// A title for the set of hubs.
    public let title: String?
    /// The hubs.
    public let hub: [DiscoverHub]?

    public init(
        size: Int? = nil,
        identifier: String? = nil,
        title: String? = nil,
        hub: [DiscoverHub]? = nil
    ) {
        self.size = size
        self.identifier = identifier
        self.title = title
        self.hub = hub
    }

    private enum CodingKeys: String, CodingKey {
        case size, identifier, title
        case hub = "Hub"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        size = values.discoverInt(.size)
        identifier = values.discoverString(.identifier)
        title = values.discoverString(.title)
        hub = values.discoverList(DiscoverHub.self, .hub)
    }
}

/// A row of items on a Discover screen — "Trending", "New on Netflix", "Because you watched…".
///
/// A hub arrives with the first few items already in ``metadata``. When ``more`` is true there
/// are further items behind ``key``, which is fetched with
/// ``DiscoverAPI/items(path:count:queryItems:)``.
public struct DiscoverHub: Codable, Hashable, Sendable {
    /// The row's title, ready to show.
    public let title: String?
    /// The kind of item in the row, or `mixed`.
    public let type: String?
    /// A stable identifier for the row, such as `movie.recentlyreleased`.
    public let hubIdentifier: String?
    /// The path that returns the row's full contents.
    public let key: String?
    /// The path that returns exactly what is shown here, which matters for a row whose
    /// contents are randomised.
    public let hubKey: String?
    /// What the row is about, in the provider's own vocabulary.
    public let context: String?
    /// How the row is meant to be laid out — `hero`, `shelf`, `grid`.
    public let style: String?
    /// How many items the row carries here.
    public let size: Int?
    /// Whether more items exist behind ``key``.
    public let more: Bool?
    /// Whether the row belongs on the home screen.
    public let promoted: Bool?
    /// Whether the row's contents change from request to request.
    public let random: Bool?
    /// The items shown in the row.
    public let metadata: [DiscoverMetadata]?
    /// Directories, on a row that lists places rather than items.
    public let directory: [DiscoverDirectory]?

    public init(
        title: String? = nil,
        type: String? = nil,
        hubIdentifier: String? = nil,
        key: String? = nil,
        hubKey: String? = nil,
        context: String? = nil,
        style: String? = nil,
        size: Int? = nil,
        more: Bool? = nil,
        promoted: Bool? = nil,
        random: Bool? = nil,
        metadata: [DiscoverMetadata]? = nil,
        directory: [DiscoverDirectory]? = nil
    ) {
        self.title = title
        self.type = type
        self.hubIdentifier = hubIdentifier
        self.key = key
        self.hubKey = hubKey
        self.context = context
        self.style = style
        self.size = size
        self.more = more
        self.promoted = promoted
        self.random = random
        self.metadata = metadata
        self.directory = directory
    }

    private enum CodingKeys: String, CodingKey {
        case title, type, hubIdentifier, key, hubKey, context, style
        case size, more, promoted, random
        case metadata = "Metadata"
        case directory = "Directory"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = values.discoverString(.title)
        type = values.discoverString(.type)
        hubIdentifier = values.discoverString(.hubIdentifier)
        key = values.discoverString(.key)
        hubKey = values.discoverString(.hubKey)
        context = values.discoverString(.context)
        style = values.discoverString(.style)
        size = values.discoverInt(.size)
        more = values.discoverBool(.more)
        promoted = values.discoverBool(.promoted)
        random = values.discoverBool(.random)
        metadata = values.discoverList(DiscoverMetadata.self, .metadata)
        directory = values.discoverList(DiscoverDirectory.self, .directory)
    }
}

/// A place in the provider's tree: a section, a genre bucket, a filter.
public struct DiscoverDirectory: Codable, Hashable, Sendable {
    /// The path this directory leads to.
    public let key: String?
    /// The directory's title.
    public let title: String?
    /// The kind of directory.
    public let type: String?
    /// A stable identifier for the directory, where it has one.
    public let id: String?
    /// The directory's poster.
    public let thumb: String?
    /// The directory's background artwork.
    public let art: String?
    /// A hub key that returns the directory's contents as rows.
    public let hubKey: String?
    /// How many items lie behind the directory.
    public let count: Int?
    /// A URL-safe form of the title.
    public let slug: String?

    public init(
        key: String? = nil,
        title: String? = nil,
        type: String? = nil,
        id: String? = nil,
        thumb: String? = nil,
        art: String? = nil,
        hubKey: String? = nil,
        count: Int? = nil,
        slug: String? = nil
    ) {
        self.key = key
        self.title = title
        self.type = type
        self.id = id
        self.thumb = thumb
        self.art = art
        self.hubKey = hubKey
        self.count = count
        self.slug = slug
    }

    private enum CodingKeys: String, CodingKey {
        case key, title, type, id, thumb, art, hubKey, count, slug
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        key = values.discoverString(.key)
        title = values.discoverString(.title)
        type = values.discoverString(.type)
        id = values.discoverString(.id)
        thumb = values.discoverString(.thumb)
        art = values.discoverString(.art)
        hubKey = values.discoverString(.hubKey)
        count = values.discoverInt(.count)
        slug = values.discoverString(.slug)
    }
}

/// The item a show should resume from.
public struct DiscoverOnDeck: Codable, Hashable, Sendable {
    // Stored as an array to break a reference cycle: `DiscoverMetadata` holds a `DiscoverOnDeck`,
    // and a struct holding an optional struct that holds it back has no finite size. An array is
    // a reference to storage elsewhere, so the cycle closes. The endpoint sends a single item.
    private let items: [DiscoverMetadata]

    /// The episode to play next, if there is one.
    public var metadata: DiscoverMetadata? { items.first }

    public init(metadata: DiscoverMetadata? = nil) {
        items = metadata.map { [$0] } ?? []
    }

    private enum CodingKeys: String, CodingKey {
        case metadata = "Metadata"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        // A single item here, not a list — but Plex has been known to send the array form, so
        // both are accepted.
        items = values.discoverList(DiscoverMetadata.self, .metadata) ?? []
    }

    // Written back in the shape it arrives in, rather than as the array it is stored as.
    public func encode(to encoder: any Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encodeIfPresent(metadata, forKey: .metadata)
    }
}

// MARK: - Search

/// A response to a Discover search.
///
/// The provider groups matches by where they came from. ``DiscoverSearchContainer/results``
/// flattens the groups in the order the provider ranked them, which is what a single list of
/// results wants; ``DiscoverSearchContainer/searchResults`` keeps the grouping for a screen
/// that shows sections.
public struct DiscoverSearchResponse: Codable, Hashable, Sendable {
    /// The container, absent if the provider returned an empty body.
    public let mediaContainer: DiscoverSearchContainer?

    public init(mediaContainer: DiscoverSearchContainer? = nil) {
        self.mediaContainer = mediaContainer
    }

    private enum CodingKeys: String, CodingKey {
        case mediaContainer = "MediaContainer"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mediaContainer = values.discoverObject(DiscoverSearchContainer.self, .mediaContainer)
    }
}

/// A container of search results.
///
/// Both shapes the endpoint returns are decoded here: the grouped `SearchResults`, and the flat
/// `SearchResult` a single-provider search answers with.
public struct DiscoverSearchContainer: Codable, Hashable, Sendable {
    /// How many groups or results this response carries.
    public let size: Int?
    /// The provider that answered.
    public let identifier: String?
    /// The matches, grouped by where they came from.
    public let searchResults: [DiscoverSearchResultGroup]?
    /// The matches, when the provider returned them ungrouped.
    public let searchResult: [DiscoverSearchResult]?

    /// Every match, from whichever shape the response used.
    public var results: [DiscoverSearchResult] {
        if let groups = searchResults, !groups.isEmpty {
            return groups.flatMap { $0.searchResult ?? [] }
        }
        return searchResult ?? []
    }

    public init(
        size: Int? = nil,
        identifier: String? = nil,
        searchResults: [DiscoverSearchResultGroup]? = nil,
        searchResult: [DiscoverSearchResult]? = nil
    ) {
        self.size = size
        self.identifier = identifier
        self.searchResults = searchResults
        self.searchResult = searchResult
    }

    private enum CodingKeys: String, CodingKey {
        case size, identifier
        case searchResults = "SearchResults"
        case searchResult = "SearchResult"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        size = values.discoverInt(.size)
        identifier = values.discoverString(.identifier)
        searchResults = values.discoverList(DiscoverSearchResultGroup.self, .searchResults)
        searchResult = values.discoverList(DiscoverSearchResult.self, .searchResult)
    }
}

/// A group of search results that share a source — a provider, or a type of match.
public struct DiscoverSearchResultGroup: Codable, Hashable, Sendable {
    /// The group's title, ready to show as a section heading.
    public let title: String?
    /// A stable identifier for the group.
    public let id: String?
    /// How many matches the group holds.
    public let size: Int?
    /// The matches.
    public let searchResult: [DiscoverSearchResult]?

    public init(
        title: String? = nil,
        id: String? = nil,
        size: Int? = nil,
        searchResult: [DiscoverSearchResult]? = nil
    ) {
        self.title = title
        self.id = id
        self.size = size
        self.searchResult = searchResult
    }

    private enum CodingKeys: String, CodingKey {
        case title, id, size
        case searchResult = "SearchResult"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = values.discoverString(.title)
        id = values.discoverString(.id)
        size = values.discoverInt(.size)
        searchResult = values.discoverList(DiscoverSearchResult.self, .searchResult)
    }
}

/// One match, with the score the provider gave it.
public struct DiscoverSearchResult: Codable, Hashable, Sendable {
    /// How well the item matched. Higher is better; the scale is the provider's own.
    public let score: Double?
    /// Why the item matched, where the provider explains itself.
    public let reason: String?
    /// The string that goes with ``reason``.
    public let reasonTitle: String?
    /// The matched item.
    public let metadata: DiscoverMetadata?

    public init(
        score: Double? = nil,
        reason: String? = nil,
        reasonTitle: String? = nil,
        metadata: DiscoverMetadata? = nil
    ) {
        self.score = score
        self.reason = reason
        self.reasonTitle = reasonTitle
        self.metadata = metadata
    }

    private enum CodingKeys: String, CodingKey {
        case score, reason, reasonTitle
        case metadata = "Metadata"
    }

    public init(from decoder: any Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        score = values.discoverDouble(.score)
        reason = values.discoverString(.reason)
        reasonTitle = values.discoverString(.reasonTitle)
        metadata = values.discoverObject(DiscoverMetadata.self, .metadata)
    }
}
