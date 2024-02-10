import XCTest
@testable import Moocher

final class EndWithSpec: XCTestCase {
    var optionalArray: [String]?
    var nilArray: [String]?
    var nilString: String?
    
    var optionalString: String?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = ["arm bar", "triangle", "oma plata"]
        
        optionalString = "Deadly Towers"
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
    
    func testToEndWithWithBothOptionals() {
        let optionalString: String? = "oma plata"
        
        expect(optionalArray).to.endWith(optionalString)
        
        expectFailure("optional array does not end with gi") {
            let anotherOptionalString: String? = "gi"
            
            expect(optionalArray).to.endWith(anotherOptionalString)
        }
    }
    
    func testToEndWithWithOptionalAndNil() {
        expectFailure("end with string is nil") {
            expect(optionalArray).to.endWith(nilString)
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
    
    func testToNotEndWithBothOptionals() {
        let optionalString: String? = "arm bar"
        
        expect(optionalArray).toNot.endWith(optionalString)
        
        expectFailure("optional array ends with arm bar") {
            let anotherOptionalString: String? = "oma plata"
            
            expect(optionalArray).toNot.endWith(anotherOptionalString)
        }
    }
    
    func testToNotEndWithWithOptionalAndNil() {
        expectFailure("end with string is nil") {
            expect(optionalArray).toNot.endWith(nilString)
        }
    }
    
    // MARK: - String
    
    func testToEndWithString() {
        expect("Indiana Jones").to.endWith("Jones")
        
        expectFailure("string should not end with Smith") {
            expect("Indiana Jones").to.endWith("Smith")
        }
    }
    
    func testToEndWithWithStringWithOptional() {
        expect(optionalString).to.endWith("Towers")
        
        expectFailure("string should not end with Bowers") {
            expect(optionalString).to.endWith("Bowers")
        }
    }
    
    func testToNotEndWithString() {
        expect("Indiana Jones").toNot.endWith("Smith")
        
        expectFailure("string should end with Jones") {
            expect("Indiana Jones").toNot.endWith("Jones")
        }
    }
    
    func testToNotEndWithWithStringWithOptional() {
        expect(optionalString).toNot.endWith("Bowers")
        
        expectFailure("string should end with Towers") {
            expect(optionalString).toNot.endWith("Towers")
        }
    }
    
    // MARK: - Compound Matcher
    
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
    
    func testToEndWithCompoundMatcherWithBothOptionals() {
        let optionalString: String? = "oma plata"
        let anotherOptionalString: String? = "arm bar"

        expect(optionalArray).to.endWith(optionalString).and.startWith(anotherOptionalString)
                
        expectFailure("optional array does not end with wrist lock") {
            let anotherOptionalString: String? = "wrist lock"
            let yetAnotherOptionalString: String? = "arm bar"
            
            expect(optionalArray).to.endWith(anotherOptionalString).and.startWith(yetAnotherOptionalString)
        }
        
        expectFailure("optional array does not end with wrist lock") {
            let anotherOptionalString: String? = "oma plata"
            let yetAnotherOptionalString: String? = "wrist lock"
            
            expect(optionalArray).to.endWith(anotherOptionalString).and.startWith(yetAnotherOptionalString)
        }
    }
    
    func testToEndWithCompoundMatcherWithOptionalAndNil() {
        expectFailure("end with string is nil") {
            expect(optionalArray).to.endWith(nilString).and.startWith(nilString)
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
        
    func testToNotStartWithCompoundMatcherWithBothOptionals() {
        let optionalString: String? = "triangle"
        let anotherOptionalString: String? = "arm bar"

        expect(optionalArray).toNot.startWith(optionalString).and.endWith(anotherOptionalString)
        
        expectFailure("optional array should not start with arm bar") {
            let anotherOptionalString: String? = "arm bar"
            let yetAnotherOptionalString: String? = "wrist lock"
            
            expect(optionalArray).toNot.startWith(anotherOptionalString).and.endWith(yetAnotherOptionalString)
        }
        
        expectFailure("optional array does not end with wrist lock") {
            let anotherOptionalString: String? = "wrist lock"
            let yetAnotherOptionalString: String? = "oma plata"
            
            expect(optionalArray).toNot.startWith(anotherOptionalString).and.endWith(yetAnotherOptionalString)
        }
    }
    
    func testToNotStartWithCompoundMatcherWithOptionalAndNil() {
        expectFailure("start with string is nil") {
            let anotherNilString: String? = nil
            
            expect(optionalArray).toNot.startWith(nilString).and.endWith(anotherNilString)
        }
    }
}
