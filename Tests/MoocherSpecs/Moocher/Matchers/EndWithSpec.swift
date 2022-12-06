import XCTest
@testable import Moocher

final class EndWithSpec: XCTestCase {
    var optionalArray: [String]?
    var nilArray: [String]?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = ["arm bar", "triangle", "oma plata"]
    }
    
    func testToEndWith() {
        expect([1, 2, 3]).to.endWith(3)
        
        expectFailure("array should not end with four") {
            expect(["one", "two", "three"]).to.endWith("four")
        }
    }
    
    func testToEndWithWithOptional() {
        expect(optionalArray).to.endWith("oma plata")
        
        expectFailure("array should not end with triangle") {
            expect(optionalArray).to.endWith("triangle")
        }
    }
    
    func testToEndWithWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.endWith("triangle")
        }
    }
    
    func testToNotEndWith() {
        expect([4, 5, 6]).toNot.endWith(1)
        
        expectFailure("array should end with c") {
            expect(["a", "b", "c"]).toNot.endWith("c")
        }
    }
    
    func testToNotEndWithWithOptional() {
        expect(optionalArray).toNot.endWith("triangle")
        
        expectFailure("optional should end with oma plata") {
            expect(optionalArray).toNot.endWith("oma plata")
        }
    }
    
    func testToNotEndWithWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.endWith("triangle")
        }
    }
    
    func testToEndWithCompoundMatcher() {
        expect([1, 2, 3]).to.endWith(3).and.startWith(1)
        
        expectFailure("array should not end with four") {
            expect(["one", "two", "three"]).to.endWith("four").and.startWith("one")
        }
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.endWith("three").and.startWith("four")
        }
    }
    
    func testToEndWithCompoundMatcherWithOptional() {
        expect(optionalArray).to.endWith("oma plata").and.startWith("arm bar")
        
        expectFailure("array should not end with paper cutter") {
            expect(optionalArray).to.endWith("paper cutter").and.startWith("arm bar")
        }
        
        expectFailure("array should not start with triangle") {
            expect(optionalArray).to.endWith("oma plata").and.startWith("triangle")
        }
    }
    
    func testToEndWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.endWith("one").and.startWith("four")
        }
    }
    
    func testToNotEndWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.endWith(7).and.startWith(4)
        
        expectFailure("array should end with three") {
            expect(["one", "two", "three"]).toNot.endWith("three").and.startWith("one")
        }
        
        expectFailure("array should not start with one") {
            expect(["one", "two", "three"]).toNot.endWith("se7en").and.startWith("one")
        }
    }
    
    func testToNotEndWithCompoundMatcherWithOptional() {
        expect(optionalArray).toNot.endWith("triangle").and.startWith("triangle")
        
        expectFailure("array should end with oma plata") {
            expect(optionalArray).toNot.endWith("oma plata").and.startWith("arm bar")
        }
        
        expectFailure("array should start with arm bar") {
            expect(optionalArray).toNot.endWith("triangle").and.startWith("arm bar")
        }
    }
    
    func testToNotEndWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.endWith("one").and.startWith("four")
        }
    }
}
