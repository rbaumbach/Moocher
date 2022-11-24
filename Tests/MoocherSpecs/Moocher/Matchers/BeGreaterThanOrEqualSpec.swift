import XCTest
@testable import Moocher

final class BeGreaterThanOrEqualSpec: XCTestCase {
    func testToBeGreaterThanOrEqual() {
        expect(10).to.beGreaterThanOrEqualTo(9)
        expect(10).to.beGreaterThanOrEqualTo(10)
        expect(BJJBelt.black).to.beGreaterThanOrEqualTo(BJJBelt.black)
        
        expectFailure("9 should not be greater than or equal to 10") {
            expect(9).to.beGreaterThanOrEqualTo(10)
        }
        
        expectFailure("white belt should not be greater than or equal to red belt") {
            expect(BJJBelt.white).to.beGreaterThanOrEqualTo(BJJBelt.red)
        }
    }
    
    func testToNotBeGreaterThanOrEqual() {
        expect(8).toNot.beGreaterThanOrEqualTo(9)
        expect(BJJBelt.blue).toNot.beGreaterThanOrEqualTo(BJJBelt.purple)
        
        expectFailure("10 should not not be greater than or equal to 9") {
            expect(10).toNot.beGreaterThanOrEqualTo(9)
        }
        
        expectFailure("brown belt should not not be greater than or equal to blue belt") {
            expect(BJJBelt.brown).toNot.beGreaterThanOrEqualTo(BJJBelt.blue)
        }
    }
}
