import XCTest
@testable import Moocher

final class HaveMaxValueOfSpec: XCTestCase {
    var optionalArray: [Int]?
    var nilArray: [Int]?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = [98, 99, 100]
    }
    
    func testToHaveMaxValueOf() {
        expect([1, 7, 1]).to.haveMaxValueOf(7)
        
        expectFailure("array should have max value of 1") {
            expect([1, 1, 1]).to.haveMaxValueOf(8)
        }
    }
    
    func testToHaveMaxValueOfWithOptional() {
        expect(optionalArray).to.haveMaxValueOf(100)
        
        expectFailure("array should have max value of 100") {
            expect(optionalArray).to.haveMaxValueOf(0)
        }
    }
    
    func testToHaveMaxValueOfWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.haveMaxValueOf(0)
        }
    }
    
    func testToNotHaveMaxValueOf() {
        expect([1, 7, 10]).toNot.haveMaxValueOf(9)
        
        expectFailure("array should not have max value of 1") {
            expect([1, 1, 1]).toNot.haveMaxValueOf(1)
        }
    }
    
    func testToNotHaveMaxValueOfWithOptional() {
        expect(optionalArray).toNot.haveMaxValueOf(1000)
        
        expectFailure("array should have max value of 100") {
            expect(optionalArray).toNot.haveMaxValueOf(100)
        }
    }
    
    func testToNotHaveMaxValueOfWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.haveMaxValueOf(0)
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
    
    func testToHaveMaxValueWithCompoundMatcherWithOptional() {
        expect(optionalArray).to.haveMaxValueOf(100).and.startWith(98)
        
        expectFailure("array should have a max value of 98") {
            expect(optionalArray).to.haveMaxValueOf(-1).and.startWith(98)
        }
        
        expectFailure("array should not start with 100") {
            expect(optionalArray).to.haveMaxValueOf(100).and.startWith(100)
        }
    }
    
    func testToHaveMaxValueWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.haveMaxValueOf(1).and.startWith(1)
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
    
    func testToNoHaveMaxValueWithCompoundMatcherWithOptional() {
        expect(optionalArray).toNot.haveMaxValueOf(10).and.startWith(10)
        
        expectFailure("array should have max value of 98") {
            expect(optionalArray).toNot.haveMaxValueOf(100).and.endWith(10)
        }

        expectFailure("array should not end with red") {
            expect(optionalArray).toNot.haveMaxValueOf(10).and.endWith(100)
        }
    }
    
    func testToNoHaveMaxValueWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.haveMaxValueOf(1).and.startWith(1)
        }
    }
}
