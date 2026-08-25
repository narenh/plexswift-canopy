import XCTest
@testable import Plexswift

final class PlexClientResponseTests: XCTestCase {

    private func makeClient(transport: MockTransport) -> PlexClient {
        PlexClient(
            configuration: PlexConfiguration(server: .localhost, token: "token-123"),
            transport: transport
        )
    }

    func testSuccessfulResponseIsDecoded() async throws {
        let client = makeClient(transport: MockTransport(json: #"{"name":"Movies","size":42}"#))

        let payload = try await client.perform(ProbeOperation())

        XCTAssertEqual(payload, ProbeOperation.Payload(name: "Movies", size: 42))
    }

    func testSendExposesStatusAndHeaders() async throws {
        let transport = MockTransport([
            .success(
                statusCode: 200,
                headers: ["Content-Type": "application/json", "X-Plex-Protocol": "1.0"],
                body: Data(#"{"name":"Movies","size":1}"#.utf8)
            )
        ])
        let client = makeClient(transport: transport)

        let response = try await client.send(ProbeOperation())

        XCTAssertEqual(response.statusCode, 200)
        XCTAssertEqual(response.value.name, "Movies")
        XCTAssertEqual(response.headers["X-Plex-Protocol"], "1.0")
    }

    /// HTTP header names are case-insensitive, and Plex is inconsistent about the casing it
    /// sends, so lookups must not depend on it.
    func testHeaderLookupIgnoresCase() async throws {
        let transport = MockTransport([
            .success(
                statusCode: 200,
                headers: ["content-TYPE": "application/json"],
                body: Data(#"{"name":"a","size":1}"#.utf8)
            )
        ])
        let client = makeClient(transport: transport)

        let response = try await client.send(ProbeOperation())

        XCTAssertEqual(response.headers["Content-Type"], "application/json")
        XCTAssertEqual(response.headers.contentType, "application/json")
    }

    func testContentTypeParametersAreStripped() {
        let headers = HTTPHeaders(["Content-Type": "application/json; charset=utf-8"])

        XCTAssertEqual(headers.contentType, "application/json")
    }

    // MARK: - Errors

    func testNonSuccessStatusThrowsAnAPIError() async {
        let client = makeClient(transport: MockTransport(errorStatus: 401, body: "Invalid token"))

        do {
            _ = try await client.perform(ProbeOperation())
            XCTFail("Expected the request to throw")
        } catch let PlexError.api(error) {
            XCTAssertEqual(error.statusCode, 401)
            XCTAssertEqual(error.operation, "probe")
            XCTAssertEqual(error.bodyText, "Invalid token")
            XCTAssertTrue(error.isAuthenticationFailure)
            XCTAssertFalse(error.isRetryable)
        } catch {
            XCTFail("Expected PlexError.api, got \(error)")
        }
    }

    func testServerErrorsAreMarkedRetryable() async {
        for status in [429, 500, 502, 503] {
            let client = makeClient(transport: MockTransport(errorStatus: status))
            do {
                _ = try await client.perform(ProbeOperation())
                XCTFail("Expected the request to throw")
            } catch let PlexError.api(error) {
                XCTAssertTrue(error.isRetryable, "HTTP \(status) should be retryable")
            } catch {
                XCTFail("Expected PlexError.api, got \(error)")
            }
        }
    }

    func testClientErrorsAreNotMarkedRetryable() async {
        for status in [400, 404, 422] {
            let client = makeClient(transport: MockTransport(errorStatus: status))
            do {
                _ = try await client.perform(ProbeOperation())
                XCTFail("Expected the request to throw")
            } catch let PlexError.api(error) {
                XCTAssertFalse(error.isRetryable, "HTTP \(status) should not be retryable")
            } catch {
                XCTFail("Expected PlexError.api, got \(error)")
            }
        }
    }

    func testUndecodableBodyThrowsADecodingError() async {
        let client = makeClient(transport: MockTransport(json: #"{"unexpected":true}"#))

        do {
            _ = try await client.perform(ProbeOperation())
            XCTFail("Expected the request to throw")
        } catch let PlexError.decoding(failure) {
            XCTAssertEqual(failure.operation, "probe")
            XCTAssertEqual(failure.contentType, "application/json")
            XCTAssertEqual(failure.body, Data(#"{"unexpected":true}"#.utf8))
            XCTAssertNotNil(failure.underlyingError)
        } catch {
            XCTFail("Expected PlexError.decoding, got \(error)")
        }
    }

    func testTransportFailureIsWrapped() async {
        let underlying = URLError(.notConnectedToInternet)
        let client = makeClient(transport: MockTransport([.failure(underlying)]))

        do {
            _ = try await client.perform(ProbeOperation())
            XCTFail("Expected the request to throw")
        } catch let PlexError.transport(error) {
            XCTAssertEqual((error as? URLError)?.code, .notConnectedToInternet)
        } catch {
            XCTFail("Expected PlexError.transport, got \(error)")
        }
    }

    /// Tokens end up in the URL whenever `TokenPlacement.queryItem` is used, and errors get
    /// logged, so the token must not survive into anything the client hands back.
    func testTokenIsRedactedFromURLsOnErrors() async {
        var configuration = PlexConfiguration(server: .localhost, token: "super-secret")
        configuration.tokenPlacement = .queryItem
        let client = PlexClient(
            configuration: configuration,
            transport: MockTransport(errorStatus: 401)
        )

        do {
            _ = try await client.perform(ProbeOperation())
            XCTFail("Expected the request to throw")
        } catch let PlexError.api(error) {
            let url = error.url?.absoluteString ?? ""
            XCTAssertFalse(url.contains("super-secret"), "Token leaked into \(url)")
            XCTAssertTrue(url.contains("X-Plex-Token=REDACTED"))
        } catch {
            XCTFail("Expected PlexError.api, got \(error)")
        }
    }

    func testTokenIsRedactedFromSuccessfulResponses() async throws {
        var configuration = PlexConfiguration(server: .localhost, token: "super-secret")
        configuration.tokenPlacement = .queryItem
        let client = PlexClient(
            configuration: configuration,
            transport: MockTransport(json: #"{"name":"a","size":1}"#)
        )

        let response = try await client.send(ProbeOperation())

        XCTAssertFalse(response.url?.absoluteString.contains("super-secret") ?? false)
    }

    // MARK: - Response shapes

    func testBinaryOperationReturnsRawBytes() async throws {
        let bytes = Data([0x89, 0x50, 0x4E, 0x47])
        let transport = MockTransport([
            .success(statusCode: 200, headers: ["Content-Type": "image/png"], body: bytes)
        ])
        let client = makeClient(transport: transport)

        let data = try await client.perform(BinaryProbeOperation())

        XCTAssertEqual(data, bytes)
    }

    /// Plex answers many writes with `200` and an empty body; decoding must not treat that as
    /// malformed JSON.
    func testEmptyResponseOperationIgnoresTheBody() async throws {
        let transport = MockTransport([
            .success(statusCode: 200, headers: [:], body: Data())
        ])
        let client = makeClient(transport: transport)

        let value = try await client.perform(
            WriteProbeOperation(payload: .init(title: "x"))
        )

        XCTAssertEqual(value, EmptyResponse())
    }

    /// 13 operations answer with XML or plain text. Their bodies must reach the caller:
    /// handing them to JSONDecoder would fail, and treating them as empty would discard the
    /// response entirely.
    func testTextualOperationReturnsTheBodyAsAString() async throws {
        let xml = "<MediaContainer size=\"1\"/>"
        let transport = MockTransport([
            .success(
                statusCode: 200,
                headers: ["Content-Type": "application/xml"],
                body: Data(xml.utf8)
            )
        ])
        let client = makeClient(transport: transport)

        let text = try await client.perform(TextProbeOperation())

        XCTAssertEqual(text, xml)
    }

    func testTextualOperationRejectsABodyThatIsNotUTF8() async {
        let transport = MockTransport([
            .success(
                statusCode: 200,
                headers: ["Content-Type": "application/xml"],
                body: Data([0xFF, 0xFE, 0xFD])
            )
        ])
        let client = makeClient(transport: transport)

        do {
            _ = try await client.perform(TextProbeOperation())
            XCTFail("Expected the request to throw")
        } catch let PlexError.decoding(failure) {
            XCTAssertEqual(failure.operation, "textProbe")
        } catch {
            XCTFail("Expected PlexError.decoding, got \(error)")
        }
    }

    func testResponseMapTransformsTheValue() async throws {
        let client = makeClient(transport: MockTransport(json: #"{"name":"Movies","size":7}"#))

        let response = try await client.send(ProbeOperation()).map(\.size)

        XCTAssertEqual(response.value, 7)
        XCTAssertEqual(response.statusCode, 200)
    }
}
