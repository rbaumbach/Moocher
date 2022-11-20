import XCTest
@testable import Moocher

final class StartWithSpec: XCTestCase {
    func testToStartWith() {
        expect([1, 2, 3]).to.startWith(1)
        
        // Note: The '_ =' is only used to silence a warning from XCTExpectFailure
        // throughout the specs
        // This is not required for usage
        
        XCTExpectFailure("array should not start with four") {
            _ = expect(["one", "two", "three"]).to.startWith("four")
        }
    }
    
    func testToNotStartWith() {
        expect([4, 5, 6]).toNot.startWith(1)
        
        XCTExpectFailure("array should start with four") {
            _ = expect(["four", "five", "six"]).toNot.startWith("four")
        }
    }
    
    func testToStartWithCompoundMatcher() {
        expect([1, 2, 3]).to.startWith(1).and.endWith(3)
        
        XCTExpectFailure("array should not start with four") {
            _ = expect(["one", "two", "three"]).to.startWith("four").and.endWith("three")
        }
        
        XCTExpectFailure("array should not end with four") {
            _ = expect(["one", "two", "three"]).to.startWith("one").and.endWith("four")
        }
    }
    
    func testToNotStartWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.startWith(7).and.endWith(4)
        
        XCTExpectFailure("array should not start with one") {
            _ = expect(["one", "two", "three"]).toNot.startWith("one").and.endWith("four")
        }
        
        XCTExpectFailure("array should not end with three") {
            _ = expect(["one", "two", "three"]).toNot.startWith("se7en").and.endWith("three")
        }
    }
}
