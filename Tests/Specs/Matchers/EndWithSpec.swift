import XCTest
@testable import Moocher

final class EndWithSpec: XCTestCase {
    func testToEndWith() {
        expect([1, 2, 3]).to.endWith(3)
        
        // Note: The '_ =' is only used to silence a warning from XCTExpectFailure
        // throughout the specs
        // This is not required for usage
        
        XCTExpectFailure("array should not end with four") {
            _ = expect(["one", "two", "three"]).to.endWith("four")
        }
    }
    
    func testToNotEndWith() {
        expect([4, 5, 6]).toNot.endWith(1)
        
        XCTExpectFailure("array should end with c") {
            _ = expect(["a", "b", "c"]).toNot.endWith("c")
        }
    }
    
    func testToEndWithCompoundMatcher() {
        expect([1, 2, 3]).to.endWith(3).and.startWith(1)
        
        XCTExpectFailure("array should not end with four") {
            _ = expect(["one", "two", "three"]).to.endWith("four").and.startWith("one")
        }
        
        XCTExpectFailure("array should not start with four") {
            _ = expect(["one", "two", "three"]).to.endWith("three").and.startWith("four")
        }
    }
    
    func testToNotEndWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.endWith(7).and.startWith(4)
        
        XCTExpectFailure("array should not end with three") {
            _ = expect(["one", "two", "three"]).toNot.endWith("three").and.startWith("one")
        }
        
        XCTExpectFailure("array should not start with one") {
            _ = expect(["one", "two", "three"]).toNot.endWith("se7en").and.startWith("one")
        }
    }
}
