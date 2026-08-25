import Foundation
import XCTest
@testable import Plexswift

/// Exercises real generated operations through the client, to check the decisions the generator
/// makes about paths, parameters, hosts and credentials.
///
/// These name specific operations on purpose. A spec change that alters one of them should
/// surface here as a compile error or a failure, rather than silently changing what the SDK
/// sends.
final class GeneratedOperationTests: XCTestCase {

    private func makeClient(
        token: String? = "token-123",
        identity: ClientIdentity? = ClientIdentity(clientIdentifier: "device-abc")
    ) -> PlexClient {
        PlexClient(
            configuration: PlexConfiguration(server: .localhost, token: token, identity: identity),
            transport: MockTransport([])
        )
    }

    // MARK: - Paths

    func testOperationWithoutParametersUsesItsLiteralPath() throws {
        let request = try makeClient().makeRequest(for: Operations.GetServerInfo())

        XCTAssertEqual(request.url?.absoluteString, "http://localhost:32400/")
    }

    func testPathParameterIsInterpolated() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetLibraryDetails(sectionId: "4")
        )

        XCTAssertEqual(request.url?.absoluteString, "http://localhost:32400/library/sections/4")
    }

    /// A list-valued path parameter uses OpenAPI's `simple` style — comma-joined — and each
    /// element is encoded before joining so an element containing a comma cannot forge a
    /// separator.
    func testArrayPathParameterIsCommaJoinedWithEncodedElements() throws {
        let request = try makeClient().makeRequest(
            for: Operations.EditMetadataItem(ids: ["1", "2,3"])
        )

        // Asserted on absoluteString: URL.path decodes escapes, which would hide the
        // difference between a separator and an encoded comma.
        XCTAssertEqual(
            request.url?.absoluteString,
            "http://localhost:32400/library/metadata/1,2%2C3"
        )
    }

    /// Without percent-encoding, a value containing a slash would add a path segment and change
    /// which endpoint is called.
    func testPathParameterCannotIntroduceExtraSegments() throws {
        let request = try makeClient().makeRequest(
            for: Operations.EditMetadataItem(ids: ["1/../../admin"])
        )

        XCTAssertEqual(
            request.url?.absoluteString,
            "http://localhost:32400/library/metadata/1%2F..%2F..%2Fadmin"
        )
    }

    // MARK: - Query parameters

    func testOptionalQueryParametersAreOmittedWhenNil() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetLibraryDetails(sectionId: "4")
        )

        XCTAssertNil(request.url?.query)
    }

    func testBooleanQueryParametersAreSentAsOneAndZero() throws {
        let request = try makeClient().makeRequest(
            for: Operations.GetMetadataItem(ids: ["1"], includeGuids: true, includeChapters: false)
        )

        XCTAssertEqual(request.queryItemsByName["includeGuids"], "1")
        XCTAssertEqual(request.queryItemsByName["includeChapters"], "0")
    }

    // MARK: - Hosts

    func testMediaServerOperationsTargetTheConfiguredServer() throws {
        let client = makeClient().with(server: .host(scheme: .https, host: "pms.example", port: 32400))

        let request = try client.makeRequest(for: Operations.GetServerInfo())

        XCTAssertEqual(request.url?.host, "pms.example")
    }

    func testCloudOperationsTargetPlexTV() throws {
        let request = try makeClient().makeRequest(for: Operations.GetTokenDetails())

        XCTAssertEqual(request.url?.absoluteString, "https://plex.tv/api/v2/user")
    }

    // MARK: - Credentials

    /// The PIN endpoints start the OAuth flow, so they must be callable before a token exists —
    /// but they do require the client identifier.
    func testPinOperationDoesNotRequireAToken() throws {
        let client = makeClient(token: nil)

        XCTAssertNoThrow(try client.makeRequest(for: Operations.CreateOAuthPin()))
    }

    func testPinOperationRequiresAClientIdentifier() {
        let client = makeClient(token: nil, identity: nil)

        XCTAssertThrowsError(try client.makeRequest(for: Operations.CreateOAuthPin())) { error in
            guard case PlexError.missingClientIdentifier = error else {
                return XCTFail("Expected PlexError.missingClientIdentifier, got \(error)")
            }
        }
    }

    // MARK: - Namespaces

    func testNamespacesReachTheirOperations() async throws {
        let transport = MockTransport(json: #"{"MediaContainer":{"size":0}}"#)
        let client = PlexClient(
            configuration: PlexConfiguration(server: .localhost, token: "t"),
            transport: transport
        )

        _ = try? await client.library.getLibrarySectionsFallback()

        // The spec's path for this operation ends in a slash, which URL.path would strip.
        XCTAssertEqual(
            transport.lastRequest?.url?.absoluteString,
            "http://localhost:32400/library/sections/"
        )
    }

    // MARK: - Response shapes

    func testBinaryOperationsDecodeToData() {
        XCTAssertTrue(Operations.TranscodeImage.Success.self == Data.self)
    }

    func testOperationIDsMatchTheSpecification() {
        XCTAssertEqual(Operations.GetServerInfo.operationID, "getServerInfo")
        XCTAssertEqual(Operations.GetMetadataItem.operationID, "getMetadataItem")
    }

    func testMethodsMatchTheSpecification() {
        XCTAssertEqual(Operations.GetServerInfo.method, .get)
        XCTAssertEqual(Operations.EditMetadataItem.method, .put)
    }
}
