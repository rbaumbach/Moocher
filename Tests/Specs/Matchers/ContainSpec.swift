import XCTest
@testable import Moocher

final class ContainSpec: XCTestCase {
    func testToContainWithSequence() {
        expect([1, 2, 3]).to.contain(1)
        
        XCTExpectFailure("array should not contain 99") {
            expect([1, 2, 3]).to.contain(99)
        }
    }
    
    func testToNotContainWithSequence() {
        expect(["tacos", "burritos", "sopes"]).toNot.contain("enchiladas")
        
        XCTExpectFailure("the set should contain 8") {
            let bag: Set<Int> = [2, 4, 8, 16]
            
            expect(bag).toNot.contain(8)
        }
    }
    
    func testToContainWithStringUsingCharacter() {
        expect("Bill and Ted").to.contain("d")
        
        XCTExpectFailure("Excellent should not contain !") {
            expect("Excellent").to.contain("!")
        }
    }
    
    func testToNotContainStringUsingCharacter() {
        expect("Wyld Stallyns").toNot.contain("i")
        
        XCTExpectFailure("Bogus should contain B") {
            expect("Bogus").toNot.contain("B")
        }
    }
    
    func testToContainWithStringUsingSubstring() {
        expect("Bob and Doug").to.contain("Doug")

        XCTExpectFailure("McKenzie should not contain Hoser") {
            expect("McKenzie").to.contain("Hoser")
        }
    }

    func testToNotContainStringUsingSubstring() {
        expect("Canada").toNot.contain("Maple Leaf")

        XCTExpectFailure("The Great White North should contain North") {
            expect("The Great White North").toNot.contain("North")
        }
    }
}
