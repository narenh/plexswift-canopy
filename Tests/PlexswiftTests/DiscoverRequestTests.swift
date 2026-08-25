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
        let request = try makeClient().makeRequest(
            for: Operations.SearchDiscoverProvider(query: "matrix")
        )

        XCTAssertEqual(request.url?.host, "discover.provider.plex.tv")
        XCTAssertEqual(request.url?.path, "/library/search")
    }

    /// Titles are described by the metadata provider, not the Discover one. Sending a metadata
    /// request to Discover returns a 404, so the two hosts must not be confused.
    func testMetadataIsAddressedToTheMetadataProvider() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverMetadata(ratingKey: "5d7768ba")
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

        XCTAssertEqual(request.url?.host, "discover.provider.plex.tv")
        XCTAssertEqual(request.url?.path, "/library/sections/watchlist/all")
        XCTAssertEqual(request.queryItemsByName["filter"], "available")
        XCTAssertEqual(request.queryItemsByName["libtype"], "movie")
    }

    // MARK: - Parameters

    func testSearchSendsTheQueryAndItsFlags() throws {
        let operation = Operations.SearchDiscoverProvider(
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

    func testOnlyTheRequestedInclusionsAreSent() throws {
        let operation = Operations.GetDiscoverMetadata(
            ratingKey: "abc",
            includeReviews: true,
            includeAvailability: true
        )

        let request = try makeClient().makeRequest(for: operation)

        XCTAssertEqual(request.queryItemsByName["includeReviews"], "1")
        XCTAssertEqual(request.queryItemsByName["includeAvailability"], "1")
        XCTAssertNil(request.queryItemsByName["includeExtras"])
        XCTAssertNil(request.queryItemsByName["includeUserState"])
    }

    /// An inclusion asked for explicitly as false is sent as `0` rather than omitted: the
    /// provider's default for a flag is its own business, and `includeX=0` says what is meant.
    func testAnInclusionDeclinedExplicitlyIsStillSent() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverMetadata(ratingKey: "abc", asyncAugmentMetadata: false)
        )

        XCTAssertEqual(request.queryItemsByName["asyncAugmentMetadata"], "0")
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
            for: Operations.GetDiscoverItems(key: "/hubs/foo", containerStart: 40, containerSize: 20)
        )

        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Container-Start"), "40")
        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Container-Size"), "20")
    }

    func testPagingHeadersAreAbsentWhenNotAskedFor() throws {
        let request = try makeClient().makeRequest(for: Operations.GetDiscoverItems(key: "/hubs/foo"))

        XCTAssertNil(request.value(forHTTPHeaderField: "X-Plex-Container-Start"))
        XCTAssertNil(request.value(forHTTPHeaderField: "X-Plex-Container-Size"))
    }

    func testTheWatchlistPagesTheSameWay() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetDiscoverWatchlist(containerStart: 0, containerSize: 50)
        )

        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Container-Start"), "0")
        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Container-Size"), "50")
    }

    // MARK: - Artwork

    /// Provider artwork paths are not resolvable against a media server, so the transcoder is
    /// the provider's own — otherwise the same endpoint, at the same path, as the media
    /// server's.
    func testImageTranscodingIsAddressedToTheMetadataProvider() throws {
        let request = try makeClient().makeRequest(
            for: Operations.TranscodeDiscoverImage(
                url: "/library/metadata/5d7768ba/thumb/1618",
                width: 300,
                height: 450,
                minSize: .n1
            )
        )

        XCTAssertEqual(request.url?.host, "metadata.provider.plex.tv")
        XCTAssertEqual(request.url?.path, "/photo/:/transcode")
        XCTAssertEqual(request.queryItemsByName["url"], "/library/metadata/5d7768ba/thumb/1618")
        XCTAssertEqual(request.queryItemsByName["width"], "300")
        XCTAssertEqual(request.queryItemsByName["height"], "450")
        XCTAssertEqual(request.queryItemsByName["minSize"], "1")
    }

    /// An image loader cannot set headers, so a URL handed to one has to carry the token in its
    /// query — which is what `tokenPlacement` is for, on Discover as anywhere else.
    func testAnArtworkURLCanBeBuiltWithoutSendingIt() throws {
        var configuration = makeClient().configuration
        configuration.tokenPlacement = .queryItem

        let request = try PlexClient(configuration: configuration).makeRequest(
            for: Operations.TranscodeDiscoverImage(url: "/library/metadata/1/thumb/2", width: 200)
        )

        XCTAssertEqual(request.queryItemsByName["X-Plex-Token"], "token-123")
        XCTAssertEqual(request.url?.host, "metadata.provider.plex.tv")
    }

    // MARK: - Namespace

    func testTheNamespaceSendsWhatItWasGiven() async throws {
        let transport = MockTransport(json: #"{"MediaContainer":{"size":0}}"#)
        let client = PlexClient(
            configuration: PlexConfiguration(
                server: .localhost,
                token: "token-123",
                identity: ClientIdentity(clientIdentifier: "device-abc", product: "TestApp")
            ),
            transport: transport
        )

        _ = try await client.discover.searchDiscoverProvider(
            query: "matrix",
            limit: 3,
            searchTypes: "movies,tv"
        )

        XCTAssertEqual(transport.lastRequest?.queryItemsByName["searchTypes"], "movies,tv")
        XCTAssertEqual(transport.lastRequest?.queryItemsByName["limit"], "3")
    }

    /// The token is not optional on these endpoints, and failing locally beats a 401 from a
    /// provider that answers with an HTML error page.
    func testAnOperationWithoutATokenFailsBeforeItIsSent() {
        let client = PlexClient(
            configuration: PlexConfiguration(
                server: .localhost,
                identity: ClientIdentity(clientIdentifier: "device-abc")
            ),
            transport: MockTransport([])
        )

        XCTAssertThrowsError(
            try client.makeRequest(for: Operations.GetDiscoverHubs())
        ) { error in
            guard case PlexError.missingToken(let operation) = error else {
                return XCTFail("Expected a missing-token failure, got \(error)")
            }
            XCTAssertEqual(operation, "getDiscoverHubs")
        }
    }
}
