import XCTest
@testable import Moocher

final class StartWithSpec: XCTestCase {
    func testToStartWith() {
        expect([1, 2, 3]).to.startWith(1)
        
        XCTExpectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.startWith("four")
        }
    }
    
    func testToNotStartWith() {
        expect([4, 5, 6]).toNot.startWith(1)
        
        XCTExpectFailure("array should start with four") {
            expect(["four", "five", "six"]).toNot.startWith("four")
        }
    }
}
