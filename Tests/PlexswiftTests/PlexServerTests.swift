import XCTest
@testable import Plexswift

final class PlexServerTests: XCTestCase {

    func testHostServerResolvesToAnAbsoluteURL() throws {
        let url = try PlexServer.host(scheme: .https, host: "192.168.1.10", port: 32400).baseURL()

        XCTAssertEqual(url.absoluteString, "https://192.168.1.10:32400")
    }

    func testLocalhostUsesTheConventionalPlexPort() throws {
        let url = try PlexServer.localhost.baseURL()

        XCTAssertEqual(url.absoluteString, "http://localhost:32400")
        XCTAssertEqual(PlexServer.defaultPort, 32400)
    }

    func testPlexDirectBuildsTheCertificateMatchingHostname() throws {
        let server = PlexServer.plexDirect(
            address: "1-2-3-4",
            identifier: "0123456789abcdef0123456789abcdef",
            port: 32400
        )

        XCTAssertEqual(
            try server.baseURL().absoluteString,
            "https://1-2-3-4.0123456789abcdef0123456789abcdef.plex.direct:32400"
        )
    }

    func testPlexDirectConvertsAnIPv4AddressToItsHyphenatedForm() throws {
        let server = PlexServer.plexDirect(ip: "10.0.0.5", identifier: "abc123")

        XCTAssertEqual(
            try server.baseURL().absoluteString,
            "https://10-0-0-5.abc123.plex.direct:32400"
        )
    }

    func testPlexDirectConvertsAnIPv6AddressToItsHyphenatedForm() throws {
        let server = PlexServer.plexDirect(ip: "2001:db8::1", identifier: "abc123")

        XCTAssertEqual(
            try server.baseURL().absoluteString,
            "https://2001-db8--1.abc123.plex.direct:32400"
        )
    }

    func testExplicitURLIsUsedVerbatim() throws {
        let url = URL(string: "https://plex.example.com/pms")!

        XCTAssertEqual(try PlexServer.url(url).baseURL(), url)
    }

    /// The previous SDK's only server value was a URL *template*, and its `default()` returned
    /// that template unsubstituted — so a client that did not override the server per call built
    /// a request against the literal string `{protocol}://{ip}:{port}`. Every case of
    /// `PlexServer` resolves instead, which is what makes the address a required, always-valid
    /// part of constructing a client.
    func testEveryServerCaseResolvesToAUsableURL() throws {
        let servers: [PlexServer] = [
            .localhost,
            .host(scheme: .https, host: "plex.example.com", port: 443),
            .plexDirect(ip: "10.0.0.5", identifier: "abc123"),
            .url(URL(string: "http://127.0.0.1:32400")!)
        ]

        for server in servers {
            let url = try server.baseURL()
            XCTAssertNotNil(url.host, "\(server) produced a URL with no host")
            XCTAssertFalse(url.absoluteString.contains("{"), "\(server) left a template placeholder")
        }
    }

    func testInvalidHostIsReportedAsAnInvalidURL() {
        XCTAssertThrowsError(try PlexServer.host(scheme: .https, host: "not a host", port: 1).baseURL()) { error in
            guard case PlexError.invalidURL = error else {
                return XCTFail("Expected PlexError.invalidURL, got \(error)")
            }
        }
    }
}

final class OperationHostTests: XCTestCase {

    func testMediaServerHostResolvesAgainstTheConfiguredServer() throws {
        let url = try OperationHost.mediaServer.baseURL(mediaServer: .localhost)

        XCTAssertEqual(url.absoluteString, "http://localhost:32400")
    }

    func testCloudHostsIgnoreTheConfiguredServer() throws {
        let cases: [(OperationHost, String)] = [
            (.plexTVv2, "https://plex.tv/api/v2"),
            (.plexTVv1, "https://plex.tv/api"),
            (.plexTV, "https://plex.tv"),
            (.discoverProvider, "https://discover.provider.plex.tv"),
            (.clientsPlexTV, "https://clients.plex.tv/api/v2")
        ]

        for (host, expected) in cases {
            XCTAssertEqual(try host.baseURL(mediaServer: .localhost).absoluteString, expected)
        }
    }
}
