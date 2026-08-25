import Foundation

/// The optional sections of a metadata response.
///
/// The metadata provider returns a spare item by default and fills it out only for the
/// `include*` flags a request asks for. Each flag costs the provider work, so a screen that
/// only needs a synopsis and a poster should not ask for reviews and extras.
///
/// ```swift
/// let item = try await client.discover.metadata(
///     ratingKey: "5d7768ba96b655001fdc0408",
///     including: [.availability, .reviews]
/// )
/// ```
///
/// ``standard`` is what a detail screen usually wants. ``all`` asks for everything, which is
/// useful while exploring the API and wasteful in a shipping app.
public struct DiscoverMetadataInclusions: OptionSet, Sendable, Hashable {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// What the account has done with the item — watched, rated, watchlisted.
    public static let userState = DiscoverMetadataInclusions(rawValue: 1 << 0)
    /// Critics' reviews.
    public static let reviews = DiscoverMetadataInclusions(rawValue: 1 << 1)
    /// Trailers, featurettes and interviews.
    public static let extras = DiscoverMetadataInclusions(rawValue: 1 << 2)
    /// Hubs of related titles.
    public static let related = DiscoverMetadataInclusions(rawValue: 1 << 3)
    /// The episode to resume a show from.
    public static let onDeck = DiscoverMetadataInclusions(rawValue: 1 << 4)
    /// A show's seasons, or a season's episodes.
    public static let children = DiscoverMetadataInclusions(rawValue: 1 << 5)
    /// Where the title can be streamed, rented or bought.
    public static let availability = DiscoverMetadataInclusions(rawValue: 1 << 6)
    /// The provider's own preference items for the record.
    public static let preferences = DiscoverMetadataInclusions(rawValue: 1 << 7)
    /// Concert and music extras.
    public static let concerts = DiscoverMetadataInclusions(rawValue: 1 << 8)
    /// Chapter and intro markers.
    public static let markers = DiscoverMetadataInclusions(rawValue: 1 << 9)
    /// Media held on services other than Plex.
    public static let externalMedia = DiscoverMetadataInclusions(rawValue: 1 << 10)
    /// Let the provider enrich the record while answering, rather than returning what it has
    /// cached. The response arrives no later, but it may be more complete.
    public static let augmentMetadata = DiscoverMetadataInclusions(rawValue: 1 << 11)

    /// Nothing beyond the item itself.
    public static let none: DiscoverMetadataInclusions = []

    /// What a detail screen usually needs: account state, availability, related titles,
    /// extras and reviews.
    public static let standard: DiscoverMetadataInclusions = [
        .userState, .availability, .related, .extras, .reviews
    ]

    /// Every flag. Complete, and the slowest of the three.
    public static let all: DiscoverMetadataInclusions = [
        .userState, .reviews, .extras, .related, .onDeck, .children, .availability,
        .preferences, .concerts, .markers, .externalMedia, .augmentMetadata
    ]

    /// The query items these inclusions add to a request.
    ///
    /// Emitted in a fixed order so that the same set always produces the same URL, which keeps
    /// caching and test assertions predictable.
    public var queryItems: [URLQueryItem] {
        var items: [URLQueryItem] = []
        func flag(_ inclusion: DiscoverMetadataInclusions, _ name: String) {
            guard contains(inclusion) else { return }
            items.append(URLQueryItem(name: name, value: "1"))
        }
        flag(.userState, "includeUserState")
        flag(.reviews, "includeReviews")
        flag(.extras, "includeExtras")
        flag(.related, "includeRelated")
        flag(.onDeck, "includeOnDeck")
        flag(.children, "includeChildren")
        flag(.availability, "includeAvailability")
        flag(.preferences, "includePreferences")
        flag(.concerts, "includeConcerts")
        flag(.markers, "includeMarkers")
        flag(.externalMedia, "includeExternalMedia")
        flag(.augmentMetadata, "asyncAugmentMetadata")
        return items
    }
}
