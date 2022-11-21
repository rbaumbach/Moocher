import XCTest
@testable import Moocher

final class StartWithSpec: XCTestCase {
    func testToStartWith() {
        expect([1, 2, 3]).to.startWith(1)
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.startWith("four")
        }
    }
    
    func testToNotStartWith() {
        expect([4, 5, 6]).toNot.startWith(1)
        
        expectFailure("array should start with four") {
            expect(["four", "five", "six"]).toNot.startWith("four")
        }
    }
    
    func testToStartWithCompoundMatcher() {
        expect([1, 2, 3]).to.startWith(1).and.endWith(3)
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.startWith("four").and.endWith("three")
        }
        
        expectFailure("array should not end with four") {
            expect(["one", "two", "three"]).to.startWith("one").and.endWith("four")
        }
    }
    
    func testToNotStartWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.startWith(7).and.endWith(4)
        
        expectFailure("array should not start with one") {
            expect(["one", "two", "three"]).toNot.startWith("one").and.endWith("four")
        }
        
        expectFailure("array should not end with three") {
            expect(["one", "two", "three"]).toNot.startWith("se7en").and.endWith("three")
        }
    }
}
