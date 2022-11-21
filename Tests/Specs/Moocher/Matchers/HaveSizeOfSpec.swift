import XCTest
@testable import Moocher

final class HaveSizeOfSpec: XCTestCase {
    func testToHaveSizeOf() {
        expect([1, 2, 3]).to.haveSizeOf(3)
        
        expectFailure("array should not have a size of 4") {
            expect(["one", "two", "three"]).to.haveSizeOf(4)
        }
    }
    
    func testToNotHaveSizeOf() {
        expect([1, 2, 3]).toNot.haveSizeOf(99)
        
        expectFailure("array should have a size of 3") {
            expect(["one", "two", "three"]).toNot.haveSizeOf(3)
        }
    }
    
    func testToHaveSizeOfWithCompoundMatcher() {
        expect([1, 2, 3]).to.haveSizeOf(3).and.startWith(1)
        
        expectFailure("array should have a size of 3") {
            expect([1, 2, 3]).to.haveSizeOf(4).and.startWith(1)
        }
        
        expectFailure("array should not start with 2") {
            expect([1, 2, 3]).to.haveSizeOf(3).and.startWith(2)
        }
    }
    
    func testToNotHaveSizeOfWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.haveSizeOf(1).and.startWith(2)
        
        expectFailure("array should have a size of 3") {
            expect([1, 2, 3]).toNot.haveSizeOf(3).and.startWith(2)
        }
        
        expectFailure("array should not start with 1") {
            expect([1, 2, 3]).toNot.haveSizeOf(99).and.startWith(1)
        }
    }
}
