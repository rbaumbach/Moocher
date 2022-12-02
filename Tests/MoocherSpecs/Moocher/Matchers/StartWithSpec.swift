import XCTest
@testable import Moocher

final class StartWithSpec: XCTestCase {
    var optionalArray: [String]?
    var nilArray: [String]?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = ["arm bar", "triangle", "oma plata"]
    }
    
    func testToStartWith() {
        expect([1, 2, 3]).to.startWith(1)
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.startWith("four")
        }
    }
    
    func testToStartWithWithOptional() {
        expect(optionalArray).to.startWith("arm bar")
        
        expectFailure("optionalArray starts with arm bar") {
            expect(optionalArray).to.startWith("arm triangle")
        }
    }
    
    func testToStartWithWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.startWith("arm bar")
        }
    }
    
    func testToNotStartWith() {
        expect([4, 5, 6]).toNot.startWith(1)
        
        expectFailure("array should start with four") {
            expect(["four", "five", "six"]).toNot.startWith("four")
        }
    }
    
    func testToNotStartWithWithOptional() {
        expect(optionalArray).toNot.startWith("paper cutter")
        
        expectFailure("optionalArray starts with arm bar") {
            expect(optionalArray).toNot.startWith("arm bar")
        }
    }
    
    func testToNotStartWithWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.startWith("arm bar")
        }
    }
    
    func testToStartWithCompoundMatcher() {
        expect([1, 2, 3]).to.startWith(1).and.endWith(3)
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.startWith("four").and.endWith("three")
        }
        
        expectFailure("array should not end with four") {
            expect(["one", "two", "three"]).to.startWith("one").and.endWith("four")
        }
    }
    
    func testToStartWithCompoundMatcherWithOptional() {
        expect(optionalArray).to.startWith("arm bar").and.endWith("oma plata")
        
        expectFailure("array should not start with triangle") {
            expect(optionalArray).to.startWith("triangle").and.endWith("oma plata")
        }
        
        expectFailure("array should not end with paper cutter") {
            expect(optionalArray).to.startWith("arm bar").and.endWith("paper cutter")
        }
    }
    
    func testToStartWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.startWith("one").and.endWith("four")
        }
    }
    
    func testToNotStartWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.startWith(7).and.endWith(4)
        
        expectFailure("array should not start with one") {
            expect(["one", "two", "three"]).toNot.startWith("one").and.endWith("four")
        }
        
        expectFailure("array should not end with three") {
            expect(["one", "two", "three"]).toNot.startWith("se7en").and.endWith("three")
        }
    }
    
    func testToNotStartWithCompoundMatcherWithOptional() {
        expect(optionalArray).toNot.startWith("triangle").and.endWith("triangle")
        
        expectFailure("array should not start with one") {
            expect(optionalArray).toNot.startWith("arm bar").and.endWith("triangle")
        }
        
        expectFailure("array should not end with oma plata") {
            expect(optionalArray).toNot.startWith("triangle").and.endWith("oma plata")
        }
    }
    
    func testToNotStartWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.startWith("one").and.endWith("four")
        }
    }
}
