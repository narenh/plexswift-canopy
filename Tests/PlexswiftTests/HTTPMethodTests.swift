import XCTest
@testable import Plexswift

final class HTTPMethodTests: XCTestCase {

    func testRawValuesAreUppercaseHTTPVerbs() {
        XCTAssertEqual(HTTPMethod.get.rawValue, "GET")
        XCTAssertEqual(HTTPMethod.post.rawValue, "POST")
        XCTAssertEqual(HTTPMethod.put.rawValue, "PUT")
        XCTAssertEqual(HTTPMethod.patch.rawValue, "PATCH")
        XCTAssertEqual(HTTPMethod.delete.rawValue, "DELETE")
        XCTAssertEqual(HTTPMethod.head.rawValue, "HEAD")
        XCTAssertEqual(HTTPMethod.options.rawValue, "OPTIONS")
    }

    func testOnlyWriteMethodsAllowARequestBody() {
        let allowed = HTTPMethod.allCases.filter(\.allowsRequestBody)
        XCTAssertEqual(Set(allowed), [.post, .put, .patch])
    }

    func testSpecVersionMatchesVendoredSpecification() {
        XCTAssertEqual(Plexswift.specVersion, "1.1.1")
    }

    func testUserAgentIdentifiesTheSDKAndVersion() {
        XCTAssertTrue(Plexswift.userAgent.hasPrefix("Plexswift/\(Plexswift.version)"))
    }
}
