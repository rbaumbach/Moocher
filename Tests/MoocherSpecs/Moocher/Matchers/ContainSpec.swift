import XCTest
@testable import Moocher

final class ContainSpec: XCTestCase {
    var optionalArray: [Int]?
    var nilArray: [Int]?
    
    var optionalString: String?
    var nilString: String?
    
    override func setUp() {
        super.setUp()
        
        optionalArray = [55, 77, 99]
        
        optionalString = "De La Riva"
    }
    
    // MARK: - Sequence
    
    func testToContainWithSequence() {
        expect([1, 2, 3]).to.contain(1)

        expectFailure("array should not contain 99") {
            expect([1, 2, 3]).to.contain(99)
        }
    }
    
    func testToContainWithSequenceWithOptional() {
        expect(optionalArray).to.contain(77)
        
        expectFailure("array should not contain 99") {
            expect(optionalArray).to.contain(100)
        }
    }
    
    func testToContainWithSequenceWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.contain(100)
        }
    }
    
    func testToNotContainWithSequence() {
        expect(["tacos", "burritos", "sopes"]).toNot.contain("enchiladas")
        
        expectFailure("the set should contain 8") {
            let bag: Set<Int> = [2, 4, 8, 16]
            
            expect(bag).toNot.contain(8)
        }
    }
    
    func testToNotContainWithSequenceWithOptional() {
        expect(optionalArray).toNot.contain(100)
        
        expectFailure("array should contain 99") {
            expect(optionalArray).toNot.contain(99)
        }
    }
    
    func testToNotContainWithSequenceWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.contain(100)
        }
    }
    
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
    
    func testToNotContainStringUsingCharacter() {
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
    
    func testToNotContainStringUsingCharacterWithOptionalNil() {
        expectFailure("string is nil") {
            expect(nilString).toNot.contain("1")
        }
    }
    
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
}
