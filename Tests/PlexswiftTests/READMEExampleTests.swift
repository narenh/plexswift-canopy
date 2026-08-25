import Foundation
import XCTest
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
@testable import Plexswift

/// The code shown in README.md, compiled.
///
/// Documentation that does not compile is worse than none, and a generated SDK's names move
/// whenever the specification does. Keeping the README's examples here as real code means a
/// rename breaks the build rather than quietly leaving the README wrong. Each function mirrors
/// one fenced block; the prose is the source of truth for wording, this file for the API.
final class READMEExampleTests: XCTestCase {

    // MARK: - Getting started

    func testGettingStartedExampleCompiles() async throws {
        let storedToken = "token"
        let storedClientIdentifier = "device-abc"

        let client = PlexClient(
            server: .host(scheme: .http, host: "192.168.1.10", port: 32400),
            token: storedToken,
            identity: ClientIdentity(
                clientIdentifier: storedClientIdentifier,
                product: "My Plex App",
                version: "1.0.0"
            ),
            transport: MockTransport(
                json: #"{"MediaContainer":{"size":1,"Directory":[{"title":"Movies","type":"movie"}]}}"#
            )
        )

        let container = try await client.library.getLibrarySectionsFallback()
        var titles: [String] = []
        for directory in container.mediaContainer?.directory ?? [] {
            titles.append(directory.title ?? "Untitled")
        }

        XCTAssertEqual(titles, ["Movies"])
    }

    // MARK: - Addressing a server

    func testServerAddressingExampleCompiles() throws {
        let machineIdentifier = "0123456789abcdef"

        let servers: [PlexServer] = [
            .host(scheme: .https, host: "plex.example.com", port: 32400),
            .plexDirect(ip: "10.0.0.5", identifier: machineIdentifier),
            .url(URL(string: "http://localhost:32400")!),
            .localhost
        ]

        for server in servers {
            XCTAssertNotNil(try server.baseURL().host)
        }

        XCTAssertEqual(
            try PlexServer.plexDirect(ip: "10.0.0.5", identifier: machineIdentifier)
                .baseURL().absoluteString,
            "https://10-0-0-5.0123456789abcdef.plex.direct:32400"
        )
    }

    // MARK: - The OAuth PIN flow

    func testPinFlowExampleCompiles() async throws {
        let storedClientIdentifier = "device-abc"
        let identity = ClientIdentity(
            clientIdentifier: storedClientIdentifier,
            product: "My Plex App"
        )
        let anonymous = PlexClient(
            server: .localhost,
            identity: identity,
            transport: MockTransport([
                .success(
                    statusCode: 201,
                    headers: ["Content-Type": "application/json"],
                    body: Data(#"{"id":42,"code":"ABCD"}"#.utf8)
                ),
                .success(
                    statusCode: 200,
                    headers: ["Content-Type": "application/json"],
                    body: Data(#"{"id":42,"code":"ABCD","authToken":"granted"}"#.utf8)
                )
            ])
        )

        let pin = try await anonymous.authentication.createOAuthPin()
        XCTAssertEqual(pin.code, "ABCD")

        let checked = try await anonymous.authentication.getOAuthPin(pinId: pin.id!)
        let token = try XCTUnwrap(checked.authToken)

        let client = anonymous.with(token: token)
        XCTAssertEqual(client.configuration.token, "granted")
    }

    // MARK: - Errors

    func testErrorHandlingExampleCompiles() async {
        let client = PlexClient(
            server: .localhost,
            token: "t",
            identity: ClientIdentity(clientIdentifier: "device-abc"),
            transport: MockTransport(errorStatus: 401)
        )

        var handled = false
        do {
            _ = try await client.library.getLibrarySectionsFallback()
        } catch let PlexError.api(error) where error.isAuthenticationFailure {
            handled = true
        } catch let PlexError.api(error) where error.isRetryable {
            XCTFail("Unexpected retryable error: \(error)")
        } catch let PlexError.api(error) {
            XCTFail("Unexpected API error: \(error.statusCode)")
        } catch let PlexError.transport(underlying) {
            XCTFail("Unexpected transport error: \(underlying)")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }

        XCTAssertTrue(handled)
    }

    /// The README claims a `catch` over `PlexError` is exhaustive.
    ///
    /// The proof is that `error` below needs no `as PlexError` and no final catch-all: because
    /// the call is declared `throws(PlexError)`, the compiler already knows the type. Writing
    /// `catch let error as PlexError` here draws an "'as' test is always true" warning.
    func testTypedThrowsMakeCatchExhaustive() async {
        let client = PlexClient(
            server: .localhost,
            token: "t",
            identity: ClientIdentity(clientIdentifier: "device-abc"),
            transport: MockTransport(errorStatus: 500)
        )

        do {
            _ = try await client.library.getLibrarySectionsFallback()
            XCTFail("Expected the request to throw")
        } catch {
            // `error` is a PlexError here, not `any Error`.
            guard case .api(let apiError) = error else {
                return XCTFail("Expected PlexError.api, got \(error)")
            }
            XCTAssertTrue(apiError.isRetryable)
        }
    }

    // MARK: - Response metadata

    func testResponseMetadataExampleCompiles() async throws {
        let client = PlexClient(
            server: .localhost,
            token: "t",
            identity: ClientIdentity(clientIdentifier: "device-abc"),
            transport: MockTransport([
                .success(
                    statusCode: 200,
                    headers: ["Content-Type": "application/json", "X-Plex-Protocol": "1.0"],
                    body: Data(#"{"MediaContainer":{"size":0}}"#.utf8)
                )
            ])
        )

        let response = try await client.send(Operations.GetServerInfo())

        XCTAssertEqual(response.statusCode, 200)
        XCTAssertEqual(response.headers["X-Plex-Protocol"], "1.0")
    }

    func testBuildingAnAuthenticatedURLWithoutSendingItCompiles() throws {
        let client = PlexClient(
            server: .localhost,
            token: "secret",
            identity: ClientIdentity(clientIdentifier: "device-abc")
        )

        var configuration = client.configuration
        configuration.tokenPlacement = .queryItem
        let request = try PlexClient(configuration: configuration)
            .makeRequest(for: Operations.TranscodeImage(url: "/library/metadata/1/thumb", width: 320))

        let url = try XCTUnwrap(request.url)
        XCTAssertEqual(url.path, "/photo/:/transcode")
        // The token has to be in the URL, because AVPlayer cannot set headers.
        XCTAssertEqual(request.queryItemsByName["X-Plex-Token"], "secret")
        XCTAssertEqual(request.queryItemsByName["width"], "320")
    }

    // MARK: - Substituting a transport

    func testStubTransportExampleCompiles() async throws {
        struct StubTransport: HTTPTransport {
            func send(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
                (
                    Data(#"{"MediaContainer":{"size":0}}"#.utf8),
                    HTTPURLResponse(
                        url: request.url!,
                        statusCode: 200,
                        httpVersion: "HTTP/1.1",
                        headerFields: ["Content-Type": "application/json"]
                    )!
                )
            }
        }

        let client = PlexClient(
            server: .localhost,
            token: "test",
            identity: ClientIdentity(clientIdentifier: "device-abc"),
            transport: StubTransport()
        )

        let container = try await client.library.getLibrarySectionsFallback()
        XCTAssertEqual(container.mediaContainer?.size, 0)
    }

    // MARK: - Plex Discover

    func testDiscoverExampleCompiles() async throws {
        let client = discoverClient(responses: [
            #"{"MediaContainer":{"SearchResult":[{"score":0.9,"Metadata":{"ratingKey":"5d9c0879","title":"Severance"}}]}}"#,
            #"{"MediaContainer":{"Metadata":[{"ratingKey":"5d9c0879","title":"Severance","Availability":[{"title":"Apple TV+","platform":"appletv","offerType":"subscription","videoQuality":"uhd"}]}]}}"#,
            #"{"MediaContainer":{"Metadata":[{"ratingKey":"5d9c0880","type":"season","index":1}]}}"#
        ])

        let matches = try await client.discover.search("severance", types: [.tv])
        let key = try XCTUnwrap(matches.items.first?.ratingKey)

        let show = try await client.discover.metadata(
            ratingKey: key,
            including: [.availability, .related]
        )
        var offers: [String] = []
        for offer in show?.streamingAvailability ?? [] {
            offers.append([offer.title ?? "", offer.videoQuality ?? ""].joined(separator: " "))
        }

        let seasons = try await client.discover.children(ratingKey: key)

        XCTAssertEqual(offers, ["Apple TV+ uhd"])
        XCTAssertEqual(seasons.items.count, 1)
    }

    func testDiscoverHubExampleCompiles() async throws {
        let client = discoverClient(responses: [
            #"{"MediaContainer":{"Hub":[{"title":"Trending","key":"/hubs/home/trending","more":true,"Metadata":[{"ratingKey":"1","title":"The Matrix"}]}]}}"#,
            #"{"MediaContainer":{"Metadata":[{"ratingKey":"1","title":"The Matrix"},{"ratingKey":"2","title":"Blade Runner"}]}}"#
        ])

        var counts: [Int] = []
        for hub in try await client.discover.hubs(count: 12).hubs {
            counts.append(hub.items.count)

            if hub.more == true, let key = hub.key {
                let rest = try await client.discover.items(path: key, count: 40)
                counts.append(rest.items.count)
            }
        }

        XCTAssertEqual(counts, [1, 2])
    }

    func testDiscoverPassthroughParameterExampleCompiles() async throws {
        let client = discoverClient(responses: [#"{"MediaContainer":{"size":0}}"#])

        let response = try await client.perform(Operations.GetDiscoverItems(
            key: "/hubs/home/recommended",
            additionalQueryItems: [URLQueryItem(name: "excludeFields", value: "summary")]
        ))

        XCTAssertEqual(response.mediaContainer?.size, 0)
    }

    private func discoverClient(responses: [String]) -> PlexClient {
        PlexClient(
            configuration: PlexConfiguration(
                server: .localhost,
                token: "token",
                identity: ClientIdentity(clientIdentifier: "device-abc", product: "My Plex App")
            ),
            transport: MockTransport(
                responses.map {
                    .success(
                        statusCode: 200,
                        headers: ["Content-Type": "application/json"],
                        body: Data($0.utf8)
                    )
                }
            )
        )
    }
}
