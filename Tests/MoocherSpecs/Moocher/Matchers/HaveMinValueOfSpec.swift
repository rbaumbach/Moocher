import XCTest
@testable import Moocher

final class HaveMinValueOfSpec: XCTestCase {
    var optionalArray: [Int]?
    var nilArray: [Int]?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = [98, 99, 100]
    }
    
    func testToHaveMinValueOf() {
        expect([1, 7, 1]).to.haveMinValueOf(1)
        
        expectFailure("array should have min value of 1") {
            expect([1, 1, 1]).to.haveMinValueOf(8)
        }
    }
    
    func testToHaveMinValueOfWithOptional() {
        expect(optionalArray).to.haveMinValueOf(98)
        
        expectFailure("array should have min value of 98") {
            expect(optionalArray).to.haveMinValueOf(0)
        }
    }
    
    func testToHaveMinValueOfWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.haveMinValueOf(0)
        }
    }
    
    func testToNotHaveMinValueOf() {
        expect([1, 7, 10]).toNot.haveMinValueOf(7)
        
        expectFailure("array should have min value of 1") {
            expect([1, 1, 1]).toNot.haveMinValueOf(1)
        }
    }
    
    func testToNotHaveMinValueOfWithOptional() {
        expect(optionalArray).toNot.haveMinValueOf(1000)
        
        expectFailure("array should have min value of 98") {
            expect(optionalArray).toNot.haveMinValueOf(98)
        }
    }
    
    func testToNotHaveMinValueOfWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.haveMinValueOf(0)
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
    
    func testToHaveMinValueWithCompoundMatcherWithOptional() {
        expect(optionalArray).to.haveMinValueOf(98).and.startWith(98)
        
        expectFailure("array should have a min value of 98") {
            expect(optionalArray).to.haveMinValueOf(-1).and.startWith(98)
        }
        
        expectFailure("array should not start with 100") {
            expect(optionalArray).to.haveMinValueOf(98).and.startWith(100)
        }
    }
    
    func testToHaveMinValueWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.haveMinValueOf(1).and.startWith(1)
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
    
    func testToNoHaveMinValueWithCompoundMatcherWithOptional() {
        expect(optionalArray).toNot.haveMinValueOf(10).and.startWith(10)
        
        expectFailure("array should have min value of 98") {
            expect(optionalArray).toNot.haveMinValueOf(98).and.endWith(10)
        }

        expectFailure("array should not end with red") {
            expect(optionalArray).toNot.haveMinValueOf(10).and.endWith(100)
        }
    }
    
    func testToNoHaveMinValueWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.haveMinValueOf(1).and.startWith(1)
        }
    }
}
