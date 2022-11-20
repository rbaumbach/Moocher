import XCTest
@testable import Moocher

final class HaveSizeOfSpec: XCTestCase {
    func testToHaveSizeOf() {
        expect([1, 2, 3]).to.haveSizeOf(3)
        
        // Note: The '_ =' is only used to silence a warning from XCTExpectFailure
        // throughout the specs
        // This is not required for usage
        
        XCTExpectFailure("array should not have a size of 4") {
            _ = expect(["one", "two", "three"]).to.haveSizeOf(4)
        }
    }
    
    func testToNotHaveSizeOf() {
        expect([1, 2, 3]).toNot.haveSizeOf(99)
        
        XCTExpectFailure("array should have a size of 3") {
            _ = expect(["one", "two", "three"]).toNot.haveSizeOf(3)
        }
    }
    
    func testToHaveSizeOfWithCompoundMatcher() {
        expect([1, 2, 3]).to.haveSizeOf(3).and.startWith(1)
        
        XCTExpectFailure("array should have a size of 3") {
            _ = expect([1, 2, 3]).to.haveSizeOf(4).and.startWith(1)
        }
        
        XCTExpectFailure("array should not start with 2") {
            _ = expect([1, 2, 3]).to.haveSizeOf(3).and.startWith(2)
        }
    }
    
    func testToNotHaveSizeOfWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.haveSizeOf(1).and.startWith(2)
        
        XCTExpectFailure("array should have a size of 3") {
            _ = expect([1, 2, 3]).toNot.haveSizeOf(3).and.startWith(2)
        }
        
        XCTExpectFailure("array should not start with 1") {
            _ = expect([1, 2, 3]).toNot.haveSizeOf(99).and.startWith(1)
        }
    }
}
