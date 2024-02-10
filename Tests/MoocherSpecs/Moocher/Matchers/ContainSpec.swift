import XCTest
@testable import Moocher

final class ContainSpec: XCTestCase {
    var optionalArray: [Int]?
    var nilArray: [Int]?
    var nilArrayItem: Int?
    
    var optionalDictionary: [String: Int]?
    var nilDictionary: [String: Int]?
    var nilDictionaryItem: Int?
    
    var optionalString: String?
    var nilString: String?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = [55, 77, 99]
        
        optionalString = "De La Riva"
    }
    
    // MARK: - Collection
    
    func testToContainWithCollection() {
        expect([1, 2, 3]).to.contain(1)

        expectFailure("array should not contain 99") {
            expect([1, 2, 3]).to.contain(99)
        }
    }
    
    func testToContainWithCollectionWithOptional() {
        expect(optionalArray).to.contain(77)
        
        expectFailure("array should not contain 99") {
            expect(optionalArray).to.contain(100)
        }
    }
    
    func testToContainWithCollectionWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.contain(100)
        }
    }
    
    func testToContainWithCollectionWithBothOptionals() {
        let optionalItem: Int? = 77
        
        expect(optionalArray).to.contain(optionalItem)
        
        expectFailure("optional array does not contain 1") {
            let anotherOptionalItem: Int? = 1
            
            expect(optionalArray).to.contain(anotherOptionalItem)
        }
    }
    
    func testToContainWithCollectionWithOptionalAndNil() {
        expectFailure("item is nil") {
            expect(optionalArray).to.contain(nilArrayItem)
        }
    }
    
    func testToNotContainWithCollection() {
        expect(["tacos", "burritos", "sopes"]).toNot.contain("enchiladas")
        
        expectFailure("the set should contain 8") {
            let bag: Set<Int> = [2, 4, 8, 16]
            
            expect(bag).toNot.contain(8)
        }
    }
    
    func testToNotContainWithCollectionWithOptional() {
        expect(optionalArray).toNot.contain(100)
        
        expectFailure("array should contain 99") {
            expect(optionalArray).toNot.contain(99)
        }
    }
    
    func testToNotContainWithCollectionWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.contain(100)
        }
    }
    
    func testToNotStartWithCollectionWithBothOptionals() {
        let optionalString: Int? = 1
        
        expect(optionalArray).toNot.contain(optionalString)
        
        expectFailure("optional array contains 77") {
            let anotherOptionalString: Int? = 77
            
            expect(optionalArray).toNot.contain(anotherOptionalString)
        }
    }
    
    func testToNotStartWithCollectionWithOptionalAndNil() {
        expectFailure("start with string is nil") {
            expect(optionalArray).toNot.contain(nilArrayItem)
        }
    }
    
    // MARK: - String
    
    // Note: String is a bit special.  If attempting to use as a Collection using the current logic:
    // where T: Collection, T.Element: Equatable, T.Element == U
    // The T.Element is actually the Character type.  This means the compiler will throw an error if you use
    // another string (more than one character). For this particular scenariom, we will just add another
    // generic method contain for String type only to handle this.
    
    func testToContainWithStringUsingCharacter() {
        expect("Bill and Ted").to.contain("d")
        
        expectFailure("Excellent should not contain !") {
            expect("Excellent").to.contain("!")
        }
    }
    
    func testToContainWithStringUsingCharacterWithOptional() {
        expect(optionalString).to.contain("R")
        
        expectFailure("array should not contain 100") {
            expect(optionalString).to.contain("100")
        }
    }
    
    func testToContainWithStringUsingCharacterWithOptionalNil() {
        expectFailure("string is nil") {
            expect(nilString).to.contain("1")
        }
    }
    
    func testToContainWithStringUsingCharacterWithBothOptionals() {
        let anotherOptionalString: Character? = Character("D")
        
        expect(optionalString).to.contain(anotherOptionalString)
        
        expectFailure("optional string does not contain Z") {
            let yetAnotherOptionalString: Character? = Character("Z")
            
            expect(optionalString).to.contain(yetAnotherOptionalString)
        }
    }
    
    func testToContainWithStringUsingCharacterWithOptionalAndNil() {
        expectFailure("item is nil") {
            expect(optionalString).to.contain(nilString)
        }
    }
    
    func testToNotContainWithStringUsingCharacter() {
        expect("Wyld Stallyns").toNot.contain("i")
        
        expectFailure("Bogus should contain B") {
            expect("Bogus").toNot.contain("B")
        }
    }
    
    func testToNotContainStringUsingCharacterWithOptional() {
        expect(optionalString).toNot.contain("1")
        
        expectFailure("string contains L") {
            expect(optionalString).toNot.contain("L")
        }
    }
    
    func testToNotContainWithStringUsingCharacterWithOptionalNil() {
        expectFailure("string is nil") {
            expect(nilString).toNot.contain("1")
        }
    }
    
    func testToNotContainWithStringUsingCharacterWithBothOptionals() {
        let anotherOptionalString: Character? = Character("Z")
        
        expect(optionalString).toNot.contain(anotherOptionalString)
        
        expectFailure("optional string contains with D") {
            let yetAnotherOptionalString: Character? = Character("D")
            
            expect(optionalString).toNot.contain(yetAnotherOptionalString)
        }
    }
    
    func testToNotContainWithStringUsingCharacterWithOptionalAndNil() {
        expectFailure("item is nil") {
            expect(optionalString).toNot.contain(nilString)
        }
    }
    
    func testToContainWithStringUsingSubstring() {
        expect("Bob and Doug").to.contain("Doug")

        expectFailure("McKenzie should not contain Hoser") {
            expect("McKenzie").to.contain("Hoser")
        }
    }
    
    func testToContainWithStringUsingSubstringWithOptional() {
        expect(optionalString).to.contain("La Riva")

        expectFailure("McKenzie should not contain Hoser") {
            expect(optionalString).to.contain("El")
        }
    }
    
    func testToContainWithStringUsingSubstringWithOptionalNil() {
        expectFailure("string is nil") {
            expect(nilString).to.contain("hosehead")
        }
    }

    func testToNotContainStringUsingSubstring() {
        expect("Canada").toNot.contain("Maple Leaf")

        expectFailure("The Great White North should contain North") {
            expect("The Great White North").toNot.contain("North")
        }
    }
    
    func testToNotContainStringUsingSubstringWithOptional() {
        expect(optionalString).toNot.contain("El")

        expectFailure("McKenzie should not contain Hoser") {
            expect(optionalString).toNot.contain("Riva")
        }
    }
    
    func testToNotContainStringUsingSubstringWithOptionalNil() {
        expectFailure("string is nil") {
            expect(nilString).toNot.contain("hosehead")
        }
    }
    
    // MARK: - Compound Matcher
    
    func testToContainWithCompoundMatcher() {
        expect([1, 2, 3]).to.contain(1).and.startWith(1)
        
        expectFailure("array should not contain four") {
            expect(["one", "two", "three"]).to.contain("four").and.startWith("one")
        }
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).to.contain("one").and.startWith("four")
        }
    }
    
    func testToContainWithCompoundMatcherWithOptional() {
        expect(optionalArray).to.contain(77).and.startWith(55)
        
        expectFailure("array should not contain 88") {
            expect(optionalArray).to.contain(88).and.startWith(55)
        }
        
        expectFailure("array should not start with 11") {
            expect(optionalArray).to.contain(55).and.startWith(11)
        }
    }
    
    func testToContainWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.contain(88).and.startWith(55)
        }
    }
    
    func testToContainWithCompoundMatcherWithBothOptionals() {
        let optionalString: Int? = 99
        let anotherOptionalString: Int? = 55

        expect(optionalArray).to.contain(optionalString).and.startWith(anotherOptionalString)
        
        expectFailure("optional array does not contain 100") {
            let anotherOptionalString: Int? = 100
            let yetAnotherOptionalString: Int? = 99
            
            expect(optionalArray).to.contain(anotherOptionalString).and.startWith(yetAnotherOptionalString)
        }
        
        expectFailure("optional array does not start with 100") {
            let anotherOptionalString: Int? = 77
            let yetAnotherOptionalString: Int? = 100
            
            expect(optionalArray).to.contain(anotherOptionalString).and.startWith(yetAnotherOptionalString)
        }
    }
        
    func testToContainWithCompoundMatcherWithOptionalAndNil() {
        expectFailure("start with string is nil") {
            let anotherNilInt: Int? = nil

            expect(optionalArray).to.contain(nilArrayItem).and.startWith(anotherNilInt)
        }
    }
    
    func testToNotContainWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.contain(99).and.startWith(2)
        
        expectFailure("array should not contain one") {
            expect(["one", "two", "three"]).toNot.contain("one").and.startWith("two")
        }
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).toNot.contain("se7en").and.startWith("one")
        }
    }
    
    func testToNotContainWithCompoundMatcherWithOptional() {
        expect(optionalArray).toNot.contain(11).and.startWith(22)
        
        expectFailure("array should contain 77") {
            expect(optionalArray).toNot.contain(77).and.startWith(11)
        }
        
        expectFailure("array should start with 55") {
            expect(optionalArray).toNot.contain(11).and.startWith(55)
        }
    }
    
    func testToNotContainWithCompoundMatcherWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.contain(88).and.startWith(55)
        }
    }
    
    func testToNotContainWithCompoundMatcherWithBothOptionals() {
        let optionalString: Int? = 100
        let anotherOptionalString: Int? = 99

        expect(optionalArray).toNot.contain(optionalString).and.startWith(anotherOptionalString)
        
        expectFailure("optional array contains 55") {
            let anotherOptionalString: Int? = 55
            let yetAnotherOptionalString: Int? = 99
            
            expect(optionalArray).toNot.contain(anotherOptionalString).and.startWith(yetAnotherOptionalString)
        }
        
        expectFailure("optional array starts with 55") {
            let anotherOptionalString: Int? = 100
            let yetAnotherOptionalString: Int? = 55
            
            expect(optionalArray).toNot.contain(anotherOptionalString).and.startWith(yetAnotherOptionalString)
        }
    }
        
    func testToNotContainWithCompoundMatcherWithOptionalAndNil() {
        expectFailure("contain with string is nil") {
            let anotherNilInt: Int? = nil

            expect(optionalArray).toNot.contain(nilArrayItem).and.startWith(anotherNilInt)
        }
    }
}
