import XCTest
@testable import Moocher

final class HaveMinValueOfSpec: XCTestCase {
    func testToHaveMinValueOf() {
        expect([1, 7, 1]).to.haveMinValueOf(1)
        
        // Note: The '_ =' is only used to silence a warning from XCTExpectFailure
        // throughout the specs
        // This is not required for usage
        
        XCTExpectFailure("array should have min value of 1") {
            _ = expect([1, 1, 1]).to.haveMinValueOf(8)
        }
    }
    
    func testToNotHaveMinValueOf() {
        expect([1, 7, 10]).toNot.haveMinValueOf(7)
        
        XCTExpectFailure("array should not have min value of 1") {
            _ = expect([1, 1, 1]).toNot.haveMinValueOf(1)
        }
    }
    
    func testToHaveMinValueWithCompoundMatcher() {
        expect([9, 9, 0]).to.haveMinValueOf(0).and.startWith(9)
        
        XCTExpectFailure("array should have a min value of 1") {
            _ = expect([1, 1, 1]).to.haveMinValueOf(2).and.startWith(1)
        }
        
        XCTExpectFailure("array should not start with 9") {
            _ = expect([1, 1, 1]).to.haveMinValueOf(1).and.startWith(9)
        }
    }
    
    func testToNotHaveMinValueWithCompoundMatcher() {
        expect([BJJBelt.white, BJJBelt.red]).toNot.haveMinValueOf(.black).and.startWith(.red)
        
        XCTExpectFailure("array should have min value of white") {
            _ = expect([BJJBelt.white, BJJBelt.red]).toNot.haveMinValueOf(.white).and.endWith(.white)
        }
        
        XCTExpectFailure("array should not end with red") {
            _ = expect([BJJBelt.white, BJJBelt.red]).toNot.haveMinValueOf(.white).and.endWith(.red)
        }
    }
}
