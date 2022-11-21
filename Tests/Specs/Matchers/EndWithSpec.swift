import XCTest
@testable import Moocher

final class EndWithSpec: XCTestCase {
    func testToEndWith() {
        expect([1, 2, 3]).to.endWith(3)
        
        expectFailure("array should not end with four") {
            expect(["one", "two", "three"]).to.endWith("four")
        }
    }
    
    func testToNotEndWith() {
        expect([4, 5, 6]).toNot.endWith(1)
        
        expectFailure("array should end with c") {
            expect(["a", "b", "c"]).toNot.endWith("c")
        }
    }
    
    func testToEndWithCompoundMatcher() {
        expect([1, 2, 3]).to.endWith(3).and.startWith(1)
        
        expectFailure("array should not end with four") {
            expect(["one", "two", "three"]).to.endWith("four").and.startWith("one")
        }
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.endWith("three").and.startWith("four")
        }
    }
    
    func testToNotEndWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.endWith(7).and.startWith(4)
        
        expectFailure("array should not end with three") {
            expect(["one", "two", "three"]).toNot.endWith("three").and.startWith("one")
        }
        
        expectFailure("array should not start with one") {
            expect(["one", "two", "three"]).toNot.endWith("se7en").and.startWith("one")
        }
    }
}
