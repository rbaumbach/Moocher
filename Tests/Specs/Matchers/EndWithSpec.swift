import XCTest
@testable import Moocher

final class EndWithSpec: XCTestCase {
    func testToEndWith() {
        expect([1, 2, 3]).to.endWith(3)
        
        XCTExpectFailure("array should not end with four") {
            expect(["one", "two", "three"]).to.endWith("four")
        }
    }
    
    func testToNotEndWith() {
        expect([4, 5, 6]).toNot.endWith(1)
        
        XCTExpectFailure("array should end with c") {
            expect(["a", "b", "c"]).toNot.endWith("c")
        }
    }
}
