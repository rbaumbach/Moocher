import XCTest
@testable import Moocher

final class BeGreaterThanSpec: XCTestCase {    
    func testToBeGreaterThan() {
        expect(10).to.beGreaterThan(9)
        expect(BJJBelt.black).to.beGreaterThan(BJJBelt.purple)
        
        expectFailure("9 is not greater than 9") {
            expect(9).to.beGreaterThan(9)
        }
        
        expectFailure("white belt is not greater than brown belt") {
            expect(BJJBelt.white).to.beGreaterThan(BJJBelt.brown)
        }
    }
    
    func testToNotBeGreaterThan() {
        expect(8).toNot.beGreaterThan(9)
        expect(9).toNot.beGreaterThan(9)
        
        expect(BJJBelt.blue).toNot.beGreaterThan(BJJBelt.purple)
        
        expectFailure("10 should not not be greater than 9") {
            expect(10).toNot.beGreaterThan(9)
        }
        
        expectFailure("brown belt is not not greater than blue belt") {
            expect(BJJBelt.brown).toNot.beGreaterThan(BJJBelt.blue)
        }
    }
}
