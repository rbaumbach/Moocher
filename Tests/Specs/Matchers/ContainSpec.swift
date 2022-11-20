import XCTest
@testable import Moocher

final class ContainSpec: XCTestCase {
    func testToContainWithSequence() {
        expect([1, 2, 3]).to.contain(1)
        
        // Note: The '_ =' is only used to silence a warning from XCTExpectFailure
        // throughout the specs
        // This is not required for usage
        
        XCTExpectFailure("array should not contain 99") {
            _ = expect([1, 2, 3]).to.contain(99)
        }
    }
    
    func testToNotContainWithSequence() {
        expect(["tacos", "burritos", "sopes"]).toNot.contain("enchiladas")
        
        XCTExpectFailure("the set should contain 8") {
            let bag: Set<Int> = [2, 4, 8, 16]
            
            _ = expect(bag).toNot.contain(8)
        }
    }
    
    func testToContainWithStringUsingCharacter() {
        expect("Bill and Ted").to.contain("d")
        
        XCTExpectFailure("Excellent should not contain !") {
            _ = expect("Excellent").to.contain("!")
        }
    }
    
    func testToNotContainStringUsingCharacter() {
        expect("Wyld Stallyns").toNot.contain("i")
        
        XCTExpectFailure("Bogus should contain B") {
            _ = expect("Bogus").toNot.contain("B")
        }
    }
    
    func testToContainWithCompoundMatcher() {
        expect([1, 2, 3]).to.contain(1).and.startWith(1)
        
        XCTExpectFailure("array should not contain four") {
            _ = expect(["one", "two", "three"]).to.contain("four").and.startWith("one")
        }
        
        XCTExpectFailure("array should not start with four") {
            _ = expect(["one", "two", "three"]).to.contain("one").and.startWith("four")
        }
    }
    
    func testToNotContainWithCompoundMatcher() {
        expect([1, 2, 3]).toNot.contain(99).and.startWith(2)
        
        XCTExpectFailure("array should not contain one") {
            _ = expect(["one", "two", "three"]).toNot.contain("one").and.startWith("two")
        }
        
        XCTExpectFailure("array should not start with four") {
            _ = expect(["one", "two", "three"]).toNot.contain("se7en").and.startWith("one")
        }
    }
    
    func testToContainWithStringUsingSubstring() {
        expect("Bob and Doug").to.contain("Doug")

        XCTExpectFailure("McKenzie should not contain Hoser") {
            _ = expect("McKenzie").to.contain("Hoser")
        }
    }

    func testToNotContainStringUsingSubstring() {
        expect("Canada").toNot.contain("Maple Leaf")

        XCTExpectFailure("The Great White North should contain North") {
            _ = expect("The Great White North").toNot.contain("North")
        }
    }
    
    func testToContainStringUsingSubstringWithCompoundMatcher() {
        expect("Bob and Doug").to.contain("Doug").and.startWith("B")
        
        XCTExpectFailure("string should not contain Hoser") {
            _ = expect("McKenzie").to.contain("Hoser").and.startWith("M")
        }
        
        XCTExpectFailure("string should not start with D") {
            _ = expect("McKenzie").to.contain("Hoser").and.startWith("D")
        }
    }
    
    func testToNotContainStringUsingSubstringWithCompoundMatcher() {
        expect("Canada").toNot.contain("Maple Leaf").and.startWith("D")
        
        XCTExpectFailure("string should contain North") {
            _ = expect("The Great White North").toNot.contain("North").and.startWith("G")
        }
        
        XCTExpectFailure("string should not start with T") {
            _ = expect("The Great White North").toNot.contain("Hosehead").and.startWith("T")
        }
    }
}
