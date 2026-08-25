import Foundation
import XCTest
import Plexswift

/// Guards against the generated types capturing names that ordinary code uses bare.
///
/// This file imports `Plexswift` *without* `@testable` and without qualifying anything, so it
/// sees the module exactly as a consumer does. The declarations below are deliberately
/// unrelated to Plex: they are the kind of code any app contains, and they must keep compiling
/// after `import Plexswift`.
///
/// They did not, once. The specification has schemas named `Collection` and `Error`, and
/// generating `public struct Collection` was enough to make a consumer's
/// `func f<C: Collection>(_ c: C) -> C.Element?` fail — the constraint named a struct — and a
/// generated `public struct Error` broke every `enum MyError: Error`. Both now generate as
/// `CollectionValue` and `ErrorValue`.
///
/// Most of the value here is in compiling at all; the assertions are incidental.
final class NamespacePollutionTests: XCTestCase {

    enum AppError: Error {
        case somethingBroke
    }

    struct Item: Identifiable, Equatable {
        let id: Int
    }

    func firstElement<C: Collection>(_ collection: C) -> C.Element? {
        collection.first
    }

    func total<S: Sequence>(_ values: S) -> Result<Int, AppError> where S.Element == Int {
        .success(values.reduce(0, +))
    }

    func unique(_ values: [Int]) -> Set<Int> {
        Set(values)
    }

    func lookup(_ table: [String: Int], _ key: String) -> Int? {
        table[key]
    }

    func testStandardLibraryNamesStillResolveToTheStandardLibrary() throws {
        XCTAssertEqual(firstElement([1, 2, 3]), 1)
        XCTAssertEqual(unique([1, 1, 2]), [1, 2])
        XCTAssertEqual(lookup(["a": 1], "a"), 1)
        XCTAssertEqual(Item(id: 1), Item(id: 1))

        guard case .success(let sum) = total([1, 2, 3]) else {
            return XCTFail("Expected a success")
        }
        XCTAssertEqual(sum, 6)
    }

    func testAConsumerErrorTypeCanStillConformToSwiftError() {
        let error: any Error = AppError.somethingBroke

        XCTAssertTrue(error is AppError)
    }

    /// The API's own `Collection` and `Error` schemas are still reachable, under names that do
    /// not collide.
    func testTheAPITypesAreStillAvailableUnderSuffixedNames() {
        XCTAssertNotNil(CollectionValue.self)
        XCTAssertNotNil(ErrorValue.self)
    }
}
