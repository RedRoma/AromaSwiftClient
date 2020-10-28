import XCTest
@testable import AromaSwiftClient

final class AromaSwiftClientTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(AromaSwiftClient().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
