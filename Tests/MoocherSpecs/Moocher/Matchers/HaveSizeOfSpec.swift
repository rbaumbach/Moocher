import XCTest
@testable import Moocher

final class HaveSizeOfSpec: XCTestCase {
    var optionalArray: [String]?
    var nilArray: [String]?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = ["Red", "Blue", "Green"]
    }
    
    func testToHaveSizeOf() {
        expect([1, 2, 3]).to.haveSizeOf(3)
        
        expectFailure("array should not have a size of 4") {
            expect(["one", "two", "three"]).to.haveSizeOf(4)
        }
    }
    
    func testToHaveSizeOfWithOptional() {
        expect(optionalArray).to.haveSizeOf(3)
        
        expectFailure("array should not have a size of 4") {
            expect(optionalArray).to.haveSizeOf(4)
        }
    }
    
    func testToHaveSizeOfWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.haveSizeOf(4)
        }
    }
    
    func testToNotHaveSizeOf() {
        expect([1, 2, 3]).toNot.haveSizeOf(99)
        
        expectFailure("array should have a size of 3") {
            expect(["one", "two", "three"]).toNot.haveSizeOf(3)
        }
    }
    
    func testToNotHaveSizeOfWithOptional() {
        expect(optionalArray).toNot.haveSizeOf(99)
        
        expectFailure("array should have a size of 3") {
            expect(optionalArray).toNot.haveSizeOf(3)
        }
    }
    
    func testToNotHaveSizeOfWithOptionalNil() {
        expectFailure("array is nil") {
            expect(optionalArray).toNot.haveSizeOf(3)
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
    
    func testToHaveSizeOfWithCompoundMatcherWithOptional() {
        expect(optionalArray).to.haveSizeOf(3).and.startWith("Red")
        
        expectFailure("array should have a size of 3") {
            expect(optionalArray).to.haveSizeOf(4).and.startWith("Red")
        }
        
        expectFailure("array should not start with 2") {
            expect(optionalArray).to.haveSizeOf(3).and.startWith("Green")
        }
    }
    
    func testToHaveSizeOfWithCompoundMatcherWithOptionalWithNil() {
        expectFailure("array should not start with 2") {
            expect(nilArray).to.haveSizeOf(3).and.startWith("Green")
        }
    }
    
    func testToNotHaveSizeOfWithCompoundMatcher() {
        expect(optionalArray).toNot.haveSizeOf(1).and.startWith("Green")
        
        expectFailure("array should have a size of 3") {
            expect(optionalArray).toNot.haveSizeOf(3).and.startWith("Green")
        }
        
        expectFailure("array should start with Red") {
            expect(optionalArray).toNot.haveSizeOf(99).and.startWith("Red")
        }
    }
    
    func testToNotHaveSizeOfWithCompoundMatcherWithOptionalWithNil() {
        expectFailure("array should not start with 2") {
            expect(nilArray).toNot.haveSizeOf(3).and.startWith("Green")
        }
    }
}
