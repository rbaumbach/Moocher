import XCTest
@testable import Moocher

final class HaveMinValueOfSpec: XCTestCase {
    func testToHaveMinValueOf() {
        expect([1, 7, 1]).to.haveMinValueOf(1)
        
        expectFailure("array should have min value of 1") {
            expect([1, 1, 1]).to.haveMinValueOf(8)
        }
    }
    
    func testToNotHaveMinValueOf() {
        expect([1, 7, 10]).toNot.haveMinValueOf(7)
        
        expectFailure("array should not have min value of 1") {
            expect([1, 1, 1]).toNot.haveMinValueOf(1)
        }
    }
    
    func testToHaveMinValueWithCompoundMatcher() {
        expect([9, 9, 0]).to.haveMinValueOf(0).and.startWith(9)
        
        expectFailure("array should have a min value of 1") {
            expect([1, 1, 1]).to.haveMinValueOf(2).and.startWith(1)
        }
        
        expectFailure("array should not start with 9") {
            expect([1, 1, 1]).to.haveMinValueOf(1).and.startWith(9)
        }
    }
    
    func testToNotHaveMinValueWithCompoundMatcher() {
        expect([BJJBelt.white, BJJBelt.red]).toNot.haveMinValueOf(.black).and.startWith(.red)
        
        expectFailure("array should have min value of white") {
            expect([BJJBelt.white, BJJBelt.red]).toNot.haveMinValueOf(.white).and.endWith(.white)
        }
        
        expectFailure("array should not end with red") {
            expect([BJJBelt.white, BJJBelt.red]).toNot.haveMinValueOf(.white).and.endWith(.red)
        }
    }
}
