import XCTest
@testable import Moocher

final class StartWithSpec: XCTestCase {
    var optionalArray: [String]?
    var nilArray: [String]?
    var nilString: String?
    
    var optionalString: String?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = ["arm bar", "triangle", "oma plata"]
        
        optionalString = "Deadly Towers"
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
    
    func testToStartWithWithBothOptionals() {
        let optionalString: String? = "arm bar"
        
        expect(optionalArray).to.startWith(optionalString)
        
        expectFailure("optional array does not start with gi") {
            let anotherOptionalString: String? = "gi"
            
            expect(optionalArray).to.startWith(anotherOptionalString)
        }
    }
    
    func testToStartWithWithOptionalAndNil() {
        expectFailure("start with string is nil") {
            expect(optionalArray).to.startWith(nilString)
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
    
    func testToNotStartWithBothOptionals() {
        let optionalString: String? = "oma plata"
        
        expect(optionalArray).toNot.startWith(optionalString)
        
        expectFailure("optional array starts with arm bar") {
            let anotherOptionalString: String? = "arm bar"
            
            expect(optionalArray).toNot.startWith(anotherOptionalString)
        }
    }
    
    func testToNotStartWithWithOptionalAndNil() {
        expectFailure("start with string is nil") {
            expect(optionalArray).toNot.startWith(nilString)
        }
    }
    
    // MARK: - String
    
    func testToStartWithString() {
        expect("Indiana Jones").to.startWith("Indiana")
        
        expectFailure("string should not start with Smith") {
            expect("Indiana Jones").to.startWith("Smith")
        }
    }
    
    func testToStartWithWithStringWithOptional() {
        expect(optionalString).to.startWith("Deadly")
        
        expectFailure("string should not start with Bowers") {
            expect(optionalString).to.endWith("Bowers")
        }
    }
    
    func testToNotStartWithString() {
        expect("Indiana Jones").toNot.startWith("Jones")
        
        expectFailure("string should start with Indiana") {
            expect("Indiana Jones").toNot.startWith("Indiana")
        }
    }
    
    func testToNotStartWithWithStringWithOptional() {
        expect(optionalString).toNot.startWith("Towers")
        
        expectFailure("string should start with Bowers") {
            expect(optionalString).toNot.startWith("Deadly")
        }
    }
    
    // MARK: - Compound Matcher
    
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
    
    func testToStartWithCompoundMatcherWithBothOptionals() {
        let optionalString: String? = "arm bar"
        let anotherOptionalString: String? = "oma plata"

        expect(optionalArray).to.startWith(optionalString).and.endWith(anotherOptionalString)
        
        expectFailure("optional array does not start with wrist lock") {
            let anotherOptionalString: String? = "wrist lock"
            let yetAnotherOptionalString: String? = "oma plata"
            
            expect(optionalArray).to.startWith(anotherOptionalString).and.endWith(yetAnotherOptionalString)
        }
        
        expectFailure("optional array does not end with wrist lock") {
            let anotherOptionalString: String? = "arm bar"
            let yetAnotherOptionalString: String? = "wrist lock"
            
            expect(optionalArray).to.startWith(anotherOptionalString).and.endWith(yetAnotherOptionalString)
        }
    }
        
    func testToStartWithCompoundMatcherWithOptionalAndNil() {
        expectFailure("start with string is nil") {
            let anotherNilString: String? = nil

            expect(optionalArray).to.startWith(nilString).and.endWith(anotherNilString)
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
