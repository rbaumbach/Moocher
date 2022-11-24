import XCTest
@testable import Moocher

final class HaveMaxValueOfSpec: XCTestCase {
    func testToHaveMaxValueOf() {
        expect([1, 7, 1]).to.haveMaxValueOf(7)
        
        expectFailure("array should have max value of 1") {
            expect([1, 1, 1]).to.haveMaxValueOf(8)
        }
    }
    
    func testToNotHaveMaxValueOf() {
        expect([1, 7, 10]).toNot.haveMaxValueOf(9)
        
        expectFailure("array should not have max value of 1") {
            expect([1, 1, 1]).toNot.haveMaxValueOf(1)
        }
    }
    
    func testToHaveMaxValueWithCompoundMatcher() {
        expect([9, 9, 0]).to.haveMaxValueOf(9).and.startWith(9)
        
        expectFailure("array should have a max value of 1") {
            expect([1, 1, 1]).to.haveMaxValueOf(2).and.startWith(1)
        }
        
        expectFailure("array should not start with 9") {
            expect([1, 1, 1]).to.haveMaxValueOf(1).and.startWith(9)
        }
    }
    
    func testToNotHaveMaxValueWithCompoundMatcher() {
        expect([BJJBelt.white, BJJBelt.red]).toNot.haveMaxValueOf(.black).and.startWith(.red)
        
        expectFailure("array should not have a max value of red") {
            expect([BJJBelt.white, BJJBelt.red]).toNot.haveMaxValueOf(.red).and.startWith(.blue)
        }
        
        expectFailure("array should not end with red") {
            expect([BJJBelt.white, BJJBelt.red]).toNot.haveMaxValueOf(.white).and.endWith(.red)
        }
    }
}
