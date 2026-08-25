import XCTest
@testable import Plexswift

final class PlexClientRequestTests: XCTestCase {

    private func makeClient(
        server: PlexServer = .localhost,
        token: String? = "token-123",
        identity: ClientIdentity? = ClientIdentity(
            clientIdentifier: "device-abc",
            product: "TestApp",
            version: "9.9.9"
        ),
        tokenPlacement: TokenPlacement = .header
    ) -> PlexClient {
        var configuration = PlexConfiguration(server: server, token: token, identity: identity)
        configuration.tokenPlacement = tokenPlacement
        return PlexClient(configuration: configuration, transport: MockTransport([]))
    }

    // MARK: - URL construction

    func testRequestTargetsTheConfiguredServer() throws {
        let client = makeClient(server: .host(scheme: .https, host: "192.168.1.10", port: 32400))

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertEqual(request.url?.absoluteString, "https://192.168.1.10:32400/probe")
    }

    /// Cloud hosts carry a path prefix, so the operation path has to be appended to the base
    /// URL rather than resolved against it — `/user` against `https://plex.tv/api/v2` must not
    /// collapse to `https://plex.tv/user`.
    func testCloudHostPathPrefixIsPreserved() throws {
        let client = makeClient()

        let request = try client.makeRequest(for: CloudProbeOperation())

        XCTAssertEqual(request.url?.absoluteString, "https://plex.tv/api/v2/user")
    }

    func testQueryItemsAreIncludedInSpecificationOrder() throws {
        let client = makeClient()
        var operation = ProbeOperation()
        operation.queryItems = [
            URLQueryItem(name: "type", value: "2"),
            URLQueryItem(name: "includeGuids", value: "1")
        ]

        let request = try client.makeRequest(for: operation)

        XCTAssertEqual(request.url?.query, "type=2&includeGuids=1")
    }

    func testQueryValuesArePercentEncoded() throws {
        let client = makeClient()
        var operation = ProbeOperation()
        operation.queryItems = [URLQueryItem(name: "title", value: "The Matrix & Co")]

        let request = try client.makeRequest(for: operation)

        XCTAssertEqual(request.queryItemsByName["title"], "The Matrix & Co")
        XCTAssertTrue(request.url?.absoluteString.contains("%26") == true)
    }

    func testOperationWithoutQueryItemsProducesNoQueryString() throws {
        let client = makeClient()

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertNil(request.url?.query)
    }

    // MARK: - Headers

    func testIdentityHeadersAreSent() throws {
        let client = makeClient()

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Client-Identifier"), "device-abc")
        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Product"), "TestApp")
        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Version"), "9.9.9")
    }

    func testJSONIsRequestedByDefault() throws {
        let client = makeClient()

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertEqual(request.value(forHTTPHeaderField: "Accept"), "application/json")
    }

    func testTokenIsSentAsAHeaderByDefault() throws {
        let client = makeClient()

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Token"), "token-123")
        XCTAssertNil(request.queryItemsByName["X-Plex-Token"])
    }

    func testTokenCanBeSentAsAQueryItem() throws {
        let client = makeClient(tokenPlacement: .queryItem)

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertEqual(request.queryItemsByName["X-Plex-Token"], "token-123")
        XCTAssertNil(request.value(forHTTPHeaderField: "X-Plex-Token"))
    }

    func testOperationHeadersOverrideBaseHeaders() throws {
        let client = makeClient()
        var operation = ProbeOperation()
        operation.headers = ["Accept": "application/xml"]

        let request = try client.makeRequest(for: operation)

        XCTAssertEqual(request.value(forHTTPHeaderField: "Accept"), "application/xml")
    }

    func testAdditionalHeadersOverrideIdentityHeaders() throws {
        var configuration = PlexConfiguration(
            server: .localhost,
            token: "t",
            identity: ClientIdentity(clientIdentifier: "device-abc", product: "TestApp")
        )
        configuration.additionalHeaders = ["X-Plex-Product": "Override"]
        let client = PlexClient(configuration: configuration, transport: MockTransport([]))

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Product"), "Override")
    }

    /// A caller must not be able to displace the token by supplying their own header, since a
    /// stale value there would silently authenticate as someone else.
    func testAdditionalHeadersCannotDisplaceTheToken() throws {
        var configuration = PlexConfiguration(server: .localhost, token: "real-token")
        configuration.additionalHeaders = ["X-Plex-Token": "stale-token"]
        let client = PlexClient(configuration: configuration, transport: MockTransport([]))

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertEqual(request.value(forHTTPHeaderField: "X-Plex-Token"), "real-token")
    }

    // MARK: - Credential requirements

    func testOperationRequiringATokenFailsWithoutOne() {
        let client = makeClient(token: nil)

        XCTAssertThrowsError(try client.makeRequest(for: ProbeOperation())) { error in
            guard case PlexError.missingToken(let operation) = error else {
                return XCTFail("Expected PlexError.missingToken, got \(error)")
            }
            XCTAssertEqual(operation, "probe")
        }
    }

    func testUnauthenticatedOperationSucceedsWithoutAToken() throws {
        let client = makeClient(token: nil)

        XCTAssertNoThrow(try client.makeRequest(for: UnauthenticatedProbeOperation()))
    }

    func testOperationRequiringAClientIdentifierFailsWithoutAnIdentity() {
        let client = makeClient(token: nil, identity: nil)

        XCTAssertThrowsError(try client.makeRequest(for: UnauthenticatedProbeOperation())) { error in
            guard case PlexError.missingClientIdentifier(let operation) = error else {
                return XCTFail("Expected PlexError.missingClientIdentifier, got \(error)")
            }
            XCTAssertEqual(operation, "unauthenticatedProbe")
        }
    }

    // MARK: - Bodies

    func testJSONBodyIsEncodedWithItsContentType() throws {
        let client = makeClient()

        let request = try client.makeRequest(
            for: WriteProbeOperation(payload: .init(title: "Blade Runner"))
        )

        XCTAssertEqual(request.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(request.httpBody, Data(#"{"title":"Blade Runner"}"#.utf8))
    }

    func testMethodsThatForbidABodyDoNotSendOne() throws {
        let client = makeClient()

        let request = try client.makeRequest(for: ProbeOperation())

        XCTAssertNil(request.httpBody)
        XCTAssertNil(request.value(forHTTPHeaderField: "Content-Type"))
    }

    func testFormBodyEscapesPlusSoItSurvivesDecoding() {
        let body = RequestBody.form([URLQueryItem(name: "q", value: "a+b c")])

        XCTAssertEqual(body.contentType, "application/x-www-form-urlencoded")
        XCTAssertEqual(String(data: body.data, encoding: .utf8), "q=a%2Bb%20c")
    }

    // MARK: - Configuration copies

    func testWithServerReturnsACopyPointedAtTheNewServer() throws {
        let client = makeClient(server: .localhost)

        let moved = client.with(server: .host(scheme: .https, host: "example.com", port: 443))

        XCTAssertEqual(try client.makeRequest(for: ProbeOperation()).url?.host, "localhost")
        XCTAssertEqual(try moved.makeRequest(for: ProbeOperation()).url?.host, "example.com")
    }

    func testWithTokenReturnsACopyCarryingTheNewToken() throws {
        let client = makeClient(token: nil)

        let authenticated = client.with(token: "fresh-token")

        XCTAssertThrowsError(try client.makeRequest(for: ProbeOperation()))
        XCTAssertEqual(
            try authenticated.makeRequest(for: ProbeOperation())
                .value(forHTTPHeaderField: "X-Plex-Token"),
            "fresh-token"
        )
    }
}
