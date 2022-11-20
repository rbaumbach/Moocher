import XCTest
@testable import Moocher

final class HaveMaxValueOfSpec: XCTestCase {
    func testToHaveMaxValueOf() {
        expect([1, 7, 1]).to.haveMaxValueOf(7)
        
        // Note: The '_ =' is only used to silence a warning from XCTExpectFailure
        // throughout the specs
        // This is not required for usage
        
        XCTExpectFailure("array should have max value of 1") {
            _ = expect([1, 1, 1]).to.haveMaxValueOf(8)
        }
    }
    
    func testToNotHaveMaxValueOf() {
        expect([1, 7, 10]).toNot.haveMaxValueOf(9)
        
        XCTExpectFailure("array should not have max value of 1") {
            _ = expect([1, 1, 1]).toNot.haveMaxValueOf(1)
        }
    }
    
    func testToHaveMaxValueWithCompoundMatcher() {
        expect([9, 9, 0]).to.haveMaxValueOf(9).and.startWith(9)
        
        XCTExpectFailure("array should have a max value of 1") {
            _ = expect([1, 1, 1]).to.haveMaxValueOf(2).and.startWith(1)
        }
        
        XCTExpectFailure("array should not start with 9") {
            _ = expect([1, 1, 1]).to.haveMaxValueOf(1).and.startWith(9)
        }
    }
    
    func testToNotHaveMaxValueWithCompoundMatcher() {
        expect([BJJBelt.white, BJJBelt.red]).toNot.haveMaxValueOf(.black).and.startWith(.red)
        
        XCTExpectFailure("array should not have a max value of red") {
            _ = expect([BJJBelt.white, BJJBelt.red]).toNot.haveMaxValueOf(.red).and.startWith(.blue)
        }
        
        XCTExpectFailure("array should not end with red") {
            _ = expect([BJJBelt.white, BJJBelt.red]).toNot.haveMaxValueOf(.white).and.endWith(.red)
        }
    }
}
