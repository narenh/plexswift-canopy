import XCTest
@testable import Plexswift

/// What the Discover models make of the payloads the providers send.
///
/// The point of these types is that they survive a payload that is not quite what was
/// expected — an undocumented API can change under a shipped app, and losing one field is
/// tolerable where losing the response is not. Each test here pins one way that can happen.
final class DiscoverDecodingTests: XCTestCase {

    private func decode<T: Decodable>(_ type: T.Type, from json: String) throws -> T {
        try JSONDecoder().decode(T.self, from: Data(json.utf8))
    }

    // MARK: - Search

    func testGroupedSearchResultsAreFlattenedInOrder() throws {
        let response = try decode(DiscoverSearchResponse.self, from: """
        {"MediaContainer": {
          "size": 2,
          "identifier": "tv.plex.provider.discover",
          "SearchResults": [
            {"id": "external", "title": "Movies", "size": 2, "SearchResult": [
              {"score": 0.94, "Metadata": {"ratingKey": "5d776831", "type": "movie",
                                            "title": "The Matrix", "year": 1999}},
              {"score": 0.71, "Metadata": {"ratingKey": "5d776832", "type": "movie",
                                            "title": "The Matrix Reloaded", "year": 2003}}
            ]},
            {"id": "people", "title": "People", "size": 1, "SearchResult": [
              {"score": 0.4, "Metadata": {"ratingKey": "5d776900", "type": "person",
                                           "title": "Keanu Reeves"}}
            ]}
          ]
        }}
        """)

        XCTAssertEqual(response.groups.count, 2)
        XCTAssertEqual(response.groups.first?.title, "Movies")
        XCTAssertEqual(
            response.items.map(\.title),
            ["The Matrix", "The Matrix Reloaded", "Keanu Reeves"]
        )
        XCTAssertEqual(response.results.first?.score, 0.94)
    }

    /// A search of one provider comes back ungrouped, with the results directly on the
    /// container. Both shapes reach the same accessors.
    func testUngroupedSearchResultsAreReadTheSameWay() throws {
        let response = try decode(DiscoverSearchResponse.self, from: """
        {"MediaContainer": {"size": 1, "SearchResult": [
          {"score": 0.8, "Metadata": {"ratingKey": "5d776831", "title": "The Matrix"}}
        ]}}
        """)

        XCTAssertEqual(response.items.map(\.title), ["The Matrix"])
    }

    func testAnEmptyContainerIsNotAFailure() throws {
        let response = try decode(DiscoverSearchResponse.self, from: #"{"MediaContainer":{"size":0}}"#)

        XCTAssertTrue(response.items.isEmpty)
        XCTAssertEqual(response.mediaContainer?.size, 0)
    }

    // MARK: - Type flip-flops

    /// The same field is quoted on one endpoint and bare on the next. A client that changed
    /// type with the endpoint would be unusable, so identifiers are always read as strings.
    func testANumericRatingKeyIsReadAsAString() throws {
        let item = try decode(DiscoverMetadata.self, from: #"{"ratingKey": 12345, "title": "X"}"#)

        XCTAssertEqual(item.ratingKey, "12345")
    }

    func testAQuotedNumberIsReadAsANumber() throws {
        let item = try decode(DiscoverMetadata.self, from: """
        {"year": "1999", "duration": "8160000", "rating": "8.7", "audienceRating": 8.5}
        """)

        XCTAssertEqual(item.year, 1999)
        XCTAssertEqual(item.duration, 8_160_000)
        XCTAssertEqual(item.rating, 8.7)
        XCTAssertEqual(item.audienceRating, 8.5)
    }

    func testBooleansAreReadFromEitherSpelling() throws {
        let numeric = try decode(DiscoverHub.self, from: #"{"more": 1, "promoted": 0}"#)
        let literal = try decode(DiscoverHub.self, from: #"{"more": true, "promoted": false}"#)
        let quoted = try decode(DiscoverHub.self, from: #"{"more": "1", "promoted": "false"}"#)

        XCTAssertEqual(numeric.more, true)
        XCTAssertEqual(numeric.promoted, false)
        XCTAssertEqual(literal.more, true)
        XCTAssertEqual(literal.promoted, false)
        XCTAssertEqual(quoted.more, true)
        XCTAssertEqual(quoted.promoted, false)
    }

    func testAValueOfTheWrongShapeLeavesOnlyThatPropertyEmpty() throws {
        let item = try decode(DiscoverMetadata.self, from: """
        {"title": "The Matrix", "year": {"unexpected": "object"}, "summary": "A hacker learns…"}
        """)

        XCTAssertEqual(item.title, "The Matrix")
        XCTAssertNil(item.year)
        XCTAssertEqual(item.summary, "A hacker learns…")
    }

    func testAnExplicitNullIsTheSameAsAnAbsentField() throws {
        let item = try decode(DiscoverMetadata.self, from: #"{"title": "X", "tagline": null}"#)

        XCTAssertNil(item.tagline)
    }

    func testAnUnfamiliarFieldIsIgnored() throws {
        let item = try decode(DiscoverMetadata.self, from: """
        {"title": "X", "somethingPlexAddedLastTuesday": {"nested": [1, 2, 3]}}
        """)

        XCTAssertEqual(item.title, "X")
    }

    // MARK: - Lists

    /// One malformed entry in a hub should cost that entry, not the row it is in.
    func testAMalformedElementIsSkippedAndTheRestSurvive() throws {
        let hub = try decode(DiscoverHub.self, from: """
        {"title": "Trending", "Metadata": [
          {"ratingKey": "1", "title": "First"},
          "not an object",
          {"ratingKey": "3", "title": "Third"}
        ]}
        """)

        XCTAssertEqual(hub.items.map(\.title), ["First", "Third"])
    }

    /// Plex's JSON is derived from its XML, and a collection with a single member is sometimes
    /// written as that member alone.
    func testASingleObjectIsAcceptedWhereAListIsExpected() throws {
        let item = try decode(DiscoverMetadata.self, from: """
        {"title": "X", "Genre": {"tag": "Science Fiction"}}
        """)

        XCTAssertEqual(item.genre?.map(\.tag), ["Science Fiction"])
    }

    func testAListThatIsNotThereIsNil() throws {
        let item = try decode(DiscoverMetadata.self, from: #"{"title": "X"}"#)

        XCTAssertNil(item.genre)
        XCTAssertNil(item.availability)
    }

    // MARK: - A detail response

    private static let detailJSON = """
    {"MediaContainer": {
      "size": 1,
      "identifier": "tv.plex.provider.metadata",
      "Metadata": [{
        "ratingKey": "5d7768ba96b655001fdc0408",
        "key": "/library/metadata/5d7768ba96b655001fdc0408",
        "guid": "plex://movie/5d7768ba96b655001fdc0408",
        "slug": "the-matrix-1999",
        "type": "movie",
        "title": "The Matrix",
        "titleSort": "Matrix",
        "year": 1999,
        "duration": 8172000,
        "contentRating": "R",
        "originallyAvailableAt": "1999-03-31",
        "publicPagesURL": "https://watch.plex.tv/movie/the-matrix",
        "thumb": "/library/metadata/5d7768ba96b655001fdc0408/thumb/1618",
        "art": "/library/metadata/5d7768ba96b655001fdc0408/art/1618",
        "rating": 8.7,
        "audienceRating": 8.5,
        "imdbRatingCount": 1943000,
        "watchlistedAt": 1712345678,
        "Image": [
          {"alt": "The Matrix", "type": "coverPoster",
           "url": "https://metadata-static.plex.tv/poster.jpg"},
          {"alt": "The Matrix", "type": "background",
           "url": "https://metadata-static.plex.tv/art.jpg"}
        ],
        "Genre": [{"tag": "Science Fiction"}, {"tag": "Action"}],
        "Director": [{"tag": "Lana Wachowski", "tagKey": "5d776826", "thumb": "https://x/d.jpg"}],
        "Role": [{"tag": "Keanu Reeves", "role": "Neo", "tagKey": "5d7768254", "index": 0}],
        "Rating": [
          {"image": "imdb://image.rating", "type": "audience", "value": 8.7},
          {"image": "rottentomatoes://image.rating.ripe", "type": "critic", "value": 8.3}
        ],
        "Guid": [{"id": "imdb://tt0133093"}, {"id": "tmdb://603"}, {"id": "tvdb://169"}],
        "Review": [{"source": "Rolling Stone", "tag": "Peter Travers", "text": "Dazzling."}],
        "Availability": [
          {"id": "1", "platform": "netflix", "title": "Netflix", "offerType": "subscription",
           "url": "https://netflix.com/title/20557937", "videoQuality": "uhd"},
          {"id": "2", "platform": "appletv", "title": "Apple TV", "offerType": "buy",
           "price": 14.99, "priceDescription": "$14.99", "quality": "hd"}
        ],
        "UserState": {"watchlistedAt": 1712345678, "viewCount": 2},
        "OnDeck": {"Metadata": {"ratingKey": "5d9c0879", "type": "episode", "index": 3,
                                 "title": "Next One", "parentIndex": 1}},
        "Related": {"Hub": [
          {"title": "Related Movies", "type": "movie", "hubIdentifier": "movie.similar",
           "key": "/library/metadata/5d7768ba96b655001fdc0408/similar", "more": true,
           "Metadata": [{"ratingKey": "5d77683f", "title": "Blade Runner"}]}
        ]}
      }]
    }}
    """

    func testADetailResponseDecodes() throws {
        let response = try decode(DiscoverItemsResponse.self, from: Self.detailJSON)
        let item = try XCTUnwrap(response.items.first)

        XCTAssertEqual(item.ratingKey, "5d7768ba96b655001fdc0408")
        XCTAssertEqual(item.slug, "the-matrix-1999")
        XCTAssertEqual(item.publicPagesURL, "https://watch.plex.tv/movie/the-matrix")
        XCTAssertEqual(item.genre?.map(\.tag), ["Science Fiction", "Action"])
        XCTAssertEqual(item.role?.first?.role, "Neo")
        XCTAssertEqual(item.ratings?.count, 2)
        XCTAssertEqual(item.reviews?.first?.source, "Rolling Stone")
        XCTAssertEqual(item.onDeck?.metadata?.title, "Next One")
        XCTAssertEqual(item.related?.hub?.first?.items.map(\.title), ["Blade Runner"])
    }

    func testExternalIdentifiersAreParsedOutOfTheGuids() throws {
        let item = try XCTUnwrap(
            try decode(DiscoverItemsResponse.self, from: Self.detailJSON).items.first
        )

        XCTAssertEqual(item.imdbID, "tt0133093")
        XCTAssertEqual(item.tmdbID, "603")
        XCTAssertEqual(item.tvdbID, "169")
        XCTAssertNil(item.externalID(for: "anidb"))
    }

    func testArtworkOfAGivenRoleIsFoundInTheImageList() throws {
        let item = try XCTUnwrap(
            try decode(DiscoverItemsResponse.self, from: Self.detailJSON).items.first
        )

        XCTAssertEqual(
            item.imageURL(ofType: "coverPoster")?.absoluteString,
            "https://metadata-static.plex.tv/poster.jpg"
        )
        XCTAssertNil(item.imageURL(ofType: "clearLogo"))
    }

    /// Availability is the part of Discover a media server cannot answer, and the distinction
    /// that matters to a viewer is between what they can watch now and what they would have to
    /// pay for.
    func testStreamingAvailabilityExcludesRentalsAndPurchases() throws {
        let item = try XCTUnwrap(
            try decode(DiscoverItemsResponse.self, from: Self.detailJSON).items.first
        )

        XCTAssertEqual(item.availability?.count, 2)
        XCTAssertEqual(item.streamingAvailability.map(\.platform), ["netflix"])
        XCTAssertEqual(item.availability?.last?.price, 14.99)
    }

    func testWatchlistStateIsReadFromEitherPlaceItArrives() throws {
        let inline = try decode(DiscoverMetadata.self, from: #"{"watchlistedAt": 1712345678}"#)
        let nested = try decode(
            DiscoverMetadata.self,
            from: #"{"UserState": {"watchlistedAt": 1712345678}}"#
        )
        let neither = try decode(DiscoverMetadata.self, from: #"{"title": "X"}"#)

        XCTAssertTrue(inline.isWatchlisted)
        XCTAssertTrue(nested.isWatchlisted)
        XCTAssertFalse(neither.isWatchlisted)
    }

    // MARK: - Hubs

    func testAHubsResponseDecodes() throws {
        let response = try decode(DiscoverHubsResponse.self, from: """
        {"MediaContainer": {
          "size": 2,
          "identifier": "tv.plex.provider.discover",
          "Hub": [
            {"title": "Trending", "type": "mixed", "hubIdentifier": "home.discover.trending",
             "key": "/hubs/home/trending", "more": true, "promoted": true, "style": "shelf",
             "Metadata": [
               {"ratingKey": "5d776831", "type": "movie", "title": "The Matrix"},
               {"ratingKey": "5d9c0879", "type": "show", "title": "Severance", "leafCount": "18"}
             ]},
            {"title": "Genres", "type": "mixed", "key": "/hubs/genres",
             "Directory": [{"key": "/hubs/genres/action", "title": "Action", "count": 412}]}
          ]
        }}
        """)

        XCTAssertEqual(response.hubs.count, 2)
        XCTAssertEqual(response.hubs.first?.more, true)
        XCTAssertEqual(response.hubs.first?.items.map(\.title), ["The Matrix", "Severance"])
        XCTAssertEqual(response.hubs.first?.items.last?.leafCount, 18)
        XCTAssertEqual(response.hubs.last?.directory?.first?.title, "Action")
        XCTAssertEqual(response.hubs.last?.directory?.first?.count, 412)
    }

    // MARK: - Children

    func testAChildrenResponseDecodesSeasons() throws {
        let response = try decode(DiscoverItemsResponse.self, from: """
        {"MediaContainer": {"size": 2, "Metadata": [
          {"ratingKey": "5d9c0880", "type": "season", "index": 1, "title": "Season 1",
           "parentTitle": "Severance", "parentRatingKey": "5d9c0879", "leafCount": 9},
          {"ratingKey": "5d9c0881", "type": "season", "index": 2, "title": "Season 2",
           "parentTitle": "Severance", "parentRatingKey": "5d9c0879", "leafCount": 10}
        ]}}
        """)

        XCTAssertEqual(response.items.map(\.index), [1, 2])
        XCTAssertEqual(response.items.first?.parentRatingKey, "5d9c0879")
        XCTAssertEqual(response.mediaContainer?.size, 2)
    }

    // MARK: - Errors

    /// Decoding is forgiving about the contents of a container, not about being handed
    /// something that is not one. A provider that answers with an error page should fail the
    /// request rather than return an empty result that reads as "no matches".
    func testABodyThatIsNotAContainerStillFails() {
        XCTAssertThrowsError(try decode(DiscoverItemsResponse.self, from: "<html>nope</html>"))
    }
}
