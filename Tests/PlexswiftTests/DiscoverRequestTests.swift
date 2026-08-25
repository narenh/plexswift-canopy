import XCTest
@testable import Plexswift

/// The requests the Discover operations build.
///
/// These endpoints are not in the specification, so nothing regenerates them and nothing else
/// checks that they still address the host, path and parameters Plex expects. That is what
/// these tests are for.
final class DiscoverRequestTests: XCTestCase {

    private func makeClient(token: String? = "token-123") -> PlexClient {
        PlexClient(
            configuration: PlexConfiguration(
                server: .localhost,
                token: token,
                identity: ClientIdentity(clientIdentifier: "device-abc", product: "TestApp")
            ),
            transport: MockTransport([])
        )
    }

    // MARK: - Hosts

    func testSearchIsAddressedToTheDiscoverProvider() throws {
        let request = try makeClient().makeRequest(for: Operations.DiscoverSearch(query: "matrix"))

        XCTAssertEqual(
            request.url?.absoluteString.hasPrefix("https://discover.provider.plex.tv/library/search"),
            true
        )
    }

    /// Titles are described by the metadata provider, not the Discover one. Sending a metadata
    /// request to Discover returns a 404, so the two hosts must not be confused.
    func testMetadataIsAddressedToTheMetadataProvider() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverMetadata(ratingKey: "5d7768ba", inclusions: .none)
        )

        XCTAssertEqual(
            request.url?.absoluteString,
            "https://metadata.provider.plex.tv/library/metadata/5d7768ba"
        )
    }

    func testChildrenIsAddressedToTheMetadataProvider() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverMetadataChildren(ratingKey: "5d7768ba")
        )

        XCTAssertEqual(
            request.url?.absoluteString,
            "https://metadata.provider.plex.tv/library/metadata/5d7768ba/children"
        )
    }

    func testWatchlistIsAddressedToTheDiscoverProvider() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverWatchlist(filter: "available", libtype: "movie")
        )

        XCTAssertEqual(request.url?.path, "/library/sections/watchlist/all")
        XCTAssertEqual(request.url?.host, "discover.provider.plex.tv")
        XCTAssertEqual(request.queryItemsByName["filter"], "available")
        XCTAssertEqual(request.queryItemsByName["libtype"], "movie")
    }

    // MARK: - Parameters

    func testSearchSendsTheQueryAndItsFlags() throws {
        let operation = Operations.DiscoverSearch(
            query: "the matrix",
            limit: 5,
            searchTypes: "movies,tv",
            searchProviders: "discover",
            includeMetadata: true
        )

        let request = try makeClient().makeRequest(for: operation)

        XCTAssertEqual(request.queryItemsByName["query"], "the matrix")
        XCTAssertEqual(request.queryItemsByName["limit"], "5")
        XCTAssertEqual(request.queryItemsByName["searchTypes"], "movies,tv")
        XCTAssertEqual(request.queryItemsByName["searchProviders"], "discover")
        // Plex reads `1` and `0`; the string `false` is a value that is present, and therefore
        // true.
        XCTAssertEqual(request.queryItemsByName["includeMetadata"], "1")
    }

    func testInclusionsBecomeTheirIncludeFlags() throws {
        let operation = Operations.GetDiscoverMetadata(
            ratingKey: "abc",
            inclusions: [.availability, .reviews],
            relatedCount: 10
        )

        let request = try makeClient().makeRequest(for: operation)

        XCTAssertEqual(request.queryItemsByName["includeReviews"], "1")
        XCTAssertEqual(request.queryItemsByName["includeAvailability"], "1")
        XCTAssertNil(request.queryItemsByName["includeExtras"])
        XCTAssertNil(request.queryItemsByName["includeUserState"])
    }

    /// `includeRelatedCount` without `includeRelated` means nothing, so it is only sent
    /// alongside the flag it qualifies.
    func testRelatedCountIsOnlySentWhenRelatedItemsWereAskedFor() throws {
        let withRelated = try makeClient().makeRequest(
            for: Operations.GetDiscoverMetadata(
                ratingKey: "abc",
                inclusions: [.related],
                relatedCount: 4
            )
        )
        let without = try makeClient().makeRequest(
            for: Operations.GetDiscoverMetadata(
                ratingKey: "abc",
                inclusions: [.reviews],
                relatedCount: 4
            )
        )

        XCTAssertEqual(withRelated.queryItemsByName["includeRelatedCount"], "4")
        XCTAssertNil(without.queryItemsByName["includeRelatedCount"])
    }

    /// The same set has to produce the same URL every time, or a response cache keyed by URL
    /// would miss at random.
    func testInclusionsAreEmittedInAStableOrder() {
        let items = DiscoverMetadataInclusions.all.queryItems.map(\.name)

        XCTAssertEqual(items.first, "includeUserState")
        XCTAssertEqual(items.last, "asyncAugmentMetadata")
        XCTAssertEqual(items, DiscoverMetadataInclusions.all.queryItems.map(\.name))
    }

    func testAnUnnamedParameterCanStillBeSent() throws {
        let operation = Operations.GetDiscoverItems(
            key: "/hubs/home/recommended",
            additionalQueryItems: [URLQueryItem(name: "excludeFields", value: "summary")]
        )

        let request = try makeClient().makeRequest(for: operation)

        XCTAssertEqual(request.queryItemsByName["excludeFields"], "summary")
    }

    // MARK: - Provider keys

    func testAKeyWithoutALeadingSlashStillFormsAValidPath() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverItems(key: "hubs/sections/recommended")
        )

        XCTAssertEqual(request.url?.path, "/hubs/sections/recommended")
    }

    /// Hub keys arrive from the provider with their own query strings. Interpolating one into a
    /// URL unexamined would bury `?type=2` in the path and fetch nothing.
    func testAKeyCarryingAQueryStringKeepsIt() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverItems(key: "/library/sections/watchlist/all?type=2", count: 20)
        )

        XCTAssertEqual(request.url?.path, "/library/sections/watchlist/all")
        XCTAssertEqual(request.queryItemsByName["type"], "2")
        XCTAssertEqual(request.queryItemsByName["count"], "20")
    }

    /// A key that pins a parameter means it: the provider chose that value, and a default
    /// supplied here must not overwrite it.
    func testAParameterSetByTheKeyWinsOverOneSuppliedSeparately() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverItems(key: "/hubs/foo?count=5", count: 50)
        )

        let counts = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)?
            .queryItems?
            .filter { $0.name == "count" }
        XCTAssertEqual(counts?.map(\.value), ["5"])
    }

    func testHubsDefaultsToTheDiscoverRoot() throws {
        let request = try makeClient().makeRequest(for: Operations.GetDiscoverHubs())

        XCTAssertEqual(request.url?.path, "/hubs")
    }

    // MARK: - Paging

    /// Plex pages these endpoints with headers rather than query parameters.
    func testPagingTravelsInTheContainerHeaders() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverItems(key: "/hubs/foo", offset: 40, pageSize: 20)
        )

        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Container-Start"), "40")
        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Container-Size"), "20")
    }

    func testPagingHeadersAreAbsentWhenNotAskedFor() throws {
        let request = try makeClient().makeRequest(for: Operations.GetDiscoverItems(key: "/hubs/foo"))

        XCTAssertNil(request.value(forHTTPHeaderField: "X-Plex-Container-Start"))
        XCTAssertNil(request.value(forHTTPHeaderField: "X-Plex-Container-Size"))
    }

    // MARK: - Artwork

    func testAnAbsoluteArtworkURLIsUsedAsItIs() {
        let url = makeClient().discover.artworkURL(
            for: "https://metadata-static.plex.tv/a/poster.jpg",
            width: 200
        )

        XCTAssertEqual(url?.absoluteString, "https://metadata-static.plex.tv/a/poster.jpg")
    }

    func testARelativeArtworkPathGoesThroughThePhotoTranscoder() throws {
        let url = try XCTUnwrap(
            makeClient().discover.artworkURL(
                for: "/library/metadata/5d7768ba/thumb/1618",
                width: 300,
                height: 450
            )
        )
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems ?? []
        let byName = Dictionary(
            items.compactMap { item in item.value.map { (item.name, $0) } },
            uniquingKeysWith: { _, new in new }
        )

        XCTAssertEqual(url.host, "metadata.provider.plex.tv")
        XCTAssertEqual(url.path, "/photo/:/transcode")
        XCTAssertEqual(byName["url"], "/library/metadata/5d7768ba/thumb/1618")
        XCTAssertEqual(byName["width"], "300")
        XCTAssertEqual(byName["height"], "450")
        // The token has to be in the URL: an image loader has nowhere to put a header.
        XCTAssertEqual(byName["X-Plex-Token"], "token-123")
    }

    /// The photo transcoder needs a size to transcode to. Without one the artwork is fetched
    /// from the provider as it is stored.
    func testArtworkWithoutASizeIsFetchedFromTheProviderDirectly() throws {
        let url = try XCTUnwrap(
            makeClient().discover.artworkURL(for: "/library/metadata/5d7768ba/thumb/1618")
        )

        XCTAssertEqual(url.host, "metadata.provider.plex.tv")
        XCTAssertEqual(url.path, "/library/metadata/5d7768ba/thumb/1618")
        XCTAssertEqual(url.query, "X-Plex-Token=token-123")
    }

    func testAnArtworkURLNeedsAToken() {
        XCTAssertNil(makeClient(token: nil).discover.artworkURL(for: "/library/metadata/1/thumb/2"))
    }

    func testAnEmptyArtworkPathHasNoURL() {
        XCTAssertNil(makeClient().discover.artworkURL(for: nil))
        XCTAssertNil(makeClient().discover.artworkURL(for: ""))
    }

    // MARK: - Namespace

    func testSearchTypesAreJoinedForTheProvider() async throws {
        let transport = MockTransport(json: #"{"MediaContainer":{"size":0}}"#)
        let client = PlexClient(
            configuration: PlexConfiguration(
                server: .localhost,
                token: "token-123",
                identity: ClientIdentity(clientIdentifier: "device-abc", product: "TestApp")
            ),
            transport: transport
        )

        _ = try await client.discover.search("matrix", types: [.movies, .tv], limit: 3)

        XCTAssertEqual(transport.lastRequest?.queryItemsByName["searchTypes"], "movies,tv")
        XCTAssertEqual(transport.lastRequest?.queryItemsByName["limit"], "3")
    }
}
