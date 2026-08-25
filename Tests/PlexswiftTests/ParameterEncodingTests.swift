import Foundation
import XCTest
@testable import Plexswift

final class QueryValueTests: XCTestCase {

    func testStringsPassThrough() {
        XCTAssertEqual(QueryValue("hello").encoded, "hello")
    }

    func testIntegers() {
        XCTAssertEqual(QueryValue(42).encoded, "42")
        XCTAssertEqual(QueryValue(-1).encoded, "-1")
    }

    /// Plex reads `1` and `0`. It treats the string `false` as a parameter that is present,
    /// and therefore true — so sending `false` turns a flag on.
    func testBooleansAreSentAsOneAndZero() {
        XCTAssertEqual(QueryValue(true).encoded, "1")
        XCTAssertEqual(QueryValue(false).encoded, "0")
    }

    func testWholeDoublesLoseTheirFractionalPart() {
        XCTAssertEqual(QueryValue(1.0).encoded, "1")
        XCTAssertEqual(QueryValue(-3.0).encoded, "-3")
    }

    func testFractionalDoublesKeepTheirPrecision() {
        XCTAssertEqual(QueryValue(1.5).encoded, "1.5")
    }

    func testVeryLargeDoublesDoNotOverflowTheIntegerConversion() {
        // Int(1e300) traps, so the whole-number shortcut is bounded.
        XCTAssertFalse(QueryValue(1e300).encoded.isEmpty)
    }

    func testStringBackedEnums() {
        enum Kind: String { case movie }
        XCTAssertEqual(QueryValue(Kind.movie).encoded, "movie")
    }

    func testIntegerBackedEnums() {
        enum Kind: Int { case show = 2 }
        XCTAssertEqual(QueryValue(Kind.show).encoded, "2")
    }

    func testGeneratedEnumsAreSupported() {
        // A generated enum reaches QueryValue through its RawRepresentable conformance.
        XCTAssertEqual(QueryValue(ImageType.coverPoster).encoded, ImageType.coverPoster.rawValue)
    }
}

final class PathComponentTests: XCTestCase {

    func testOrdinaryValuesAreUnchanged() {
        XCTAssertEqual(PathComponent("12345").description, "12345")
        XCTAssertEqual(PathComponent(42).description, "42")
    }

    /// A slash would introduce a new path segment and change which endpoint is called.
    func testSlashesAreEscaped() {
        XCTAssertEqual(PathComponent("a/b").description, "a%2Fb")
        XCTAssertEqual(
            PathComponent("../../admin").description,
            "..%2F..%2Fadmin"
        )
    }

    /// A comma separates the elements of a list-valued path parameter.
    func testCommasAreEscaped() {
        XCTAssertEqual(PathComponent("a,b").description, "a%2Cb")
    }

    func testSemicolonsAreEscaped() {
        XCTAssertEqual(PathComponent("a;b").description, "a%3Bb")
    }

    func testSpacesAndQueryDelimitersAreEscaped() {
        XCTAssertEqual(PathComponent("a b").description, "a%20b")
        XCTAssertEqual(PathComponent("a?b").description, "a%3Fb")
        XCTAssertEqual(PathComponent("a#b").description, "a%23b")
    }

    func testUnicodeIsEscaped() {
        XCTAssertEqual(PathComponent("café").description, "caf%C3%A9")
    }

    func testBooleansUseTheSameRepresentationAsQueryValues() {
        XCTAssertEqual(PathComponent(true).description, "1")
    }
}

final class DeepObjectQueryTests: XCTestCase {

    private func items(_ json: AnyJSON, name: String = "filter") -> [(String, String?)] {
        DeepObjectQuery.items(name: name, json: json).map { ($0.name, $0.value) }
    }

    func testObjectMembersBecomeBracketedItems() {
        let encoded = items(["type": 1, "year": 2020])

        XCTAssertEqual(
            encoded.map(\.0),
            ["filter[type]", "filter[year]"]
        )
        XCTAssertEqual(encoded.map(\.1), ["1", "2020"])
    }

    func testMembersAreOrderedByKeySoOutputIsStable() {
        XCTAssertEqual(
            items(["b": 1, "a": 2]).map(\.0),
            ["filter[a]", "filter[b]"]
        )
    }

    func testNullMembersAreOmitted() {
        XCTAssertEqual(items(["set": 1, "unset": nil]).map(\.0), ["filter[set]"])
    }

    func testBooleansUseThePlexRepresentation() {
        XCTAssertEqual(items(["unwatched": true]).map(\.1), ["1"])
    }

    func testArraysRepeatTheKey() {
        let encoded = items(["genre": ["a", "b"]])

        XCTAssertEqual(encoded.map(\.0), ["filter[genre]", "filter[genre]"])
        XCTAssertEqual(encoded.map(\.1), ["a", "b"])
    }

    func testNestedObjectsNestTheBrackets() {
        XCTAssertEqual(
            items(["a": ["b": 1]]).map(\.0),
            ["filter[a][b]"]
        )
    }

    func testEncodingAValueGoesThroughItsCodableRepresentation() throws {
        struct Filter: Encodable {
            let unwatched: Bool
            let year: Int
        }

        let encoded = try DeepObjectQuery.items(name: "q", value: Filter(unwatched: true, year: 1999))

        XCTAssertEqual(
            encoded.map { "\($0.name)=\($0.value ?? "")" },
            ["q[unwatched]=1", "q[year]=1999"]
        )
    }

    func testAScalarValueIsSentUnderTheBareName() {
        let encoded = items(.string("raw query"))

        XCTAssertEqual(encoded.map(\.0), ["filter"])
        XCTAssertEqual(encoded.map(\.1), ["raw query"])
    }
}

final class RequestBodyTests: XCTestCase {

    func testJSONBodyUsesTheSuppliedEncoder() throws {
        struct Payload: Encodable { let b: Int; let a: Int }
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]

        let body = try RequestBody.json(Payload(b: 2, a: 1), encoder: encoder)

        XCTAssertEqual(body.contentType, "application/json")
        XCTAssertEqual(String(data: body.data, encoding: .utf8), #"{"a":1,"b":2}"#)
    }

    func testTextBody() {
        let body = RequestBody.text("line one\nline two")

        XCTAssertEqual(body.contentType, "text/plain; charset=utf-8")
        XCTAssertEqual(String(data: body.data, encoding: .utf8), "line one\nline two")
    }

    func testMultipartBodyWrapsThePayloadInOnePart() throws {
        let payload = Data([0x89, 0x50, 0x4E, 0x47])

        let body = RequestBody.multipart(
            fieldName: "file",
            data: payload,
            filename: "poster.png",
            contentType: "image/png",
            boundary: "TESTBOUNDARY"
        )

        XCTAssertEqual(body.contentType, "multipart/form-data; boundary=TESTBOUNDARY")

        let text = try XCTUnwrap(String(data: body.data, encoding: .isoLatin1))
        XCTAssertTrue(text.hasPrefix("--TESTBOUNDARY\r\n"))
        XCTAssertTrue(text.contains(#"Content-Disposition: form-data; name="file"; filename="poster.png""#))
        XCTAssertTrue(text.contains("Content-Type: image/png\r\n\r\n"))
        XCTAssertTrue(text.hasSuffix("\r\n--TESTBOUNDARY--\r\n"))
    }

    func testMultipartBodyPreservesTheExactBytes() throws {
        let payload = Data((0...255).map(UInt8.init))

        let body = RequestBody.multipart(
            fieldName: "file",
            data: payload,
            boundary: "B"
        )

        let header = try XCTUnwrap(
            "--B\r\nContent-Disposition: form-data; name=\"file\"; filename=\"upload\"\r\nContent-Type: application/octet-stream\r\n\r\n".data(using: .utf8)
        )
        let trailer = try XCTUnwrap("\r\n--B--\r\n".data(using: .utf8))

        XCTAssertEqual(body.data, header + payload + trailer)
    }

    func testFormBodyPercentEncodesReservedCharacters() {
        let body = RequestBody.form([
            URLQueryItem(name: "user", value: "a@b.com"),
            URLQueryItem(name: "note", value: "x&y=z")
        ])

        let text = String(data: body.data, encoding: .utf8)
        XCTAssertEqual(text, "user=a@b.com&note=x%26y%3Dz")
    }
}

final class ClientIdentityTests: XCTestCase {

    func testRequiredHeadersAreAlwaysPresent() {
        let headers = ClientIdentity(clientIdentifier: "abc", product: "App", version: "1.0").headers

        XCTAssertEqual(headers["X-Plex-Client-Identifier"], "abc")
        XCTAssertEqual(headers["X-Plex-Product"], "App")
        XCTAssertEqual(headers["X-Plex-Version"], "1.0")
    }

    func testOptionalHeadersAreOmittedWhenUnset() {
        let headers = ClientIdentity(clientIdentifier: "abc").headers

        XCTAssertNil(headers["X-Plex-Device"])
        XCTAssertNil(headers["X-Plex-Platform"])
        XCTAssertNil(headers["X-Plex-Marketplace"])
    }

    func testEveryIdentityHeaderTheSpecificationNamesCanBeSet() {
        let identity = ClientIdentity(
            clientIdentifier: "abc",
            product: "App",
            version: "1.0",
            deviceName: "Naren's iPhone",
            device: "iPhone",
            platform: "iOS",
            platformVersion: "18.0",
            model: "iPhone16,1",
            deviceVendor: "Apple",
            marketplace: "apple"
        )

        XCTAssertEqual(
            Set(identity.headers.keys),
            [
                "X-Plex-Client-Identifier",
                "X-Plex-Product",
                "X-Plex-Version",
                "X-Plex-Device-Name",
                "X-Plex-Device",
                "X-Plex-Platform",
                "X-Plex-Platform-Version",
                "X-Plex-Model",
                "X-Plex-Device-Vendor",
                "X-Plex-Marketplace"
            ]
        )
    }
}
