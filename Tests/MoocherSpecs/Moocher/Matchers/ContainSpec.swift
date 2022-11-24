import XCTest
@testable import Moocher

final class ContainSpec: XCTestCase {
    func testToContainWithSequence() {
        expect([1, 2, 3]).to.contain(1)

        expectFailure("array should not contain 99") {
            expect([1, 2, 3]).to.contain(99)
        }
    }
    
    func testToNotContainWithSequence() {
        expect(["tacos", "burritos", "sopes"]).toNot.contain("enchiladas")
        
        expectFailure("the set should contain 8") {
            let bag: Set<Int> = [2, 4, 8, 16]
            
            expect(bag).toNot.contain(8)
        }
    }
    
    func testToContainWithStringUsingCharacter() {
        expect("Bill and Ted").to.contain("d")
        
        expectFailure("Excellent should not contain !") {
            expect("Excellent").to.contain("!")
        }
    }
    
    func testToNotContainStringUsingCharacter() {
        expect("Wyld Stallyns").toNot.contain("i")
        
        expectFailure("Bogus should contain B") {
            expect("Bogus").toNot.contain("B")
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
    
    func testToNotContainWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.contain(99).and.startWith(2)
        
        expectFailure("array should not contain one") {
            expect(["one", "two", "three"]).toNot.contain("one").and.startWith("two")
        }
        
        expectFailure("array should not start with four") {
            expect(["one", "two", "three"]).toNot.contain("se7en").and.startWith("one")
        }
    }
    
    func testToContainWithStringUsingSubstring() {
        expect("Bob and Doug").to.contain("Doug")

        expectFailure("McKenzie should not contain Hoser") {
            expect("McKenzie").to.contain("Hoser")
        }
    }

    func testToNotContainStringUsingSubstring() {
        expect("Canada").toNot.contain("Maple Leaf")

        expectFailure("The Great White North should contain North") {
            expect("The Great White North").toNot.contain("North")
        }
    }
    
    func testToContainStringUsingSubstringWithCompoundMatcher() {
        expect("Bob and Doug").to.contain("Doug").and.startWith("B")
        
        expectFailure("string should not contain Hoser") {
            expect("McKenzie").to.contain("Hoser").and.startWith("M")
        }
        
        expectFailure("string should not start with D") {
            expect("McKenzie").to.contain("Hoser").and.startWith("D")
        }
    }
    
    func testToNotContainStringUsingSubstringWithCompoundMatcher() {
        expect("Canada").toNot.contain("Maple Leaf").and.startWith("D")
        
        expectFailure("string should contain North") {
            expect("The Great White North").toNot.contain("North").and.startWith("G")
        }
        
        expectFailure("string should not start with T") {
            expect("The Great White North").toNot.contain("Hosehead").and.startWith("T")
        }
    }
}
