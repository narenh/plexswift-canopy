import XCTest
@testable import Plexswift

final class AnyJSONTests: XCTestCase {

    private let decoder = JSONDecoder()
    private let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        return encoder
    }()

    private func decode(_ json: String) throws -> AnyJSON {
        try decoder.decode(AnyJSON.self, from: Data(json.utf8))
    }

    func testDecodesEachJSONType() throws {
        XCTAssertEqual(try decode("null"), .null)
        XCTAssertEqual(try decode("true"), .bool(true))
        XCTAssertEqual(try decode("42"), .int(42))
        XCTAssertEqual(try decode("4.5"), .double(4.5))
        XCTAssertEqual(try decode("\"hello\""), .string("hello"))
        XCTAssertEqual(try decode("[1,2]"), .array([.int(1), .int(2)]))
        XCTAssertEqual(try decode(#"{"a":1}"#), .object(["a": .int(1)]))
    }

    /// Integers are tried before doubles so that a whole number does not round-trip as `1.0`,
    /// which would change the request Plex receives when the value is echoed back.
    func testWholeNumbersRoundTripAsIntegers() throws {
        let value = try decode("7")

        XCTAssertEqual(value, .int(7))
        XCTAssertEqual(String(data: try encoder.encode(value), encoding: .utf8), "7")
    }

    func testNestedStructureRoundTrips() throws {
        let json = #"{"a":[1,{"b":null}],"c":"d"}"#

        let value = try decode(json)
        let reencoded = String(data: try encoder.encode(value), encoding: .utf8)

        XCTAssertEqual(reencoded, json)
    }

    func testTypedAccessors() throws {
        let value = try decode(#"{"port":32400,"name":"Plex","secure":true,"ratio":1.5}"#)

        XCTAssertEqual(value["port"]?.intValue, 32400)
        XCTAssertEqual(value["name"]?.stringValue, "Plex")
        XCTAssertEqual(value["secure"]?.boolValue, true)
        XCTAssertEqual(value["ratio"]?.doubleValue, 1.5)
        XCTAssertNil(value["missing"])
    }

    func testIntValueWidensAndNarrowsOnlyWhenExact() {
        XCTAssertEqual(AnyJSON.double(3.0).intValue, 3)
        XCTAssertNil(AnyJSON.double(3.5).intValue)
        XCTAssertEqual(AnyJSON.int(3).doubleValue, 3.0)
    }

    func testSubscriptsReturnNilForTheWrongShape() throws {
        let array = try decode("[10,20]")

        XCTAssertEqual(array[1]?.intValue, 20)
        XCTAssertNil(array[5])
        XCTAssertNil(array["key"])
        XCTAssertNil(try decode("5")[0])
    }

    func testNullIsDistinguishedFromAbsence() throws {
        let value = try decode(#"{"a":null}"#)

        XCTAssertEqual(value["a"], AnyJSON.null)
        XCTAssertTrue(value["a"]?.isNull == true)
        XCTAssertNil(value["b"])
    }

    func testLiteralsBuildTheExpectedValues() {
        let value: AnyJSON = ["name": "Plex", "port": 32400, "tags": ["a", "b"], "off": nil]

        XCTAssertEqual(value["name"], .string("Plex"))
        XCTAssertEqual(value["port"], .int(32400))
        XCTAssertEqual(value["tags"], .array([.string("a"), .string("b")]))
        XCTAssertEqual(value["off"], .null)
    }

    func testDescriptionIsStableForObjects() {
        let value: AnyJSON = ["b": 2, "a": 1]

        XCTAssertEqual(value.description, "{a: 1, b: 2}")
    }
}
