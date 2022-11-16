import XCTest
@testable import Moocher

final class BeLessThanSpec: XCTestCase {
    func testToBeLessThan() {
        expect(9).to.beLessThan(10)
        expect(BJJBelt.white).to.beLessThan(BJJBelt.blue)
        
        XCTExpectFailure("9 should not be less than 9") {
            expect(9).to.beLessThan(9)
        }
        
        XCTExpectFailure("white belt should not be less than white belt") {
            expect(BJJBelt.white).to.beLessThan(BJJBelt.white)
        }
    }
    
    func testToNotBeLessThan() {
        expect(9).toNot.beLessThan(8)
        expect(9).toNot.beLessThan(9)
        expect(BJJBelt.blue).toNot.beLessThan(BJJBelt.white)
        
        XCTExpectFailure("9 should be less than 10") {
            expect(9).toNot.beLessThan(10)
        }
        
        XCTExpectFailure("white belt should be less than blue belt") {
            expect(BJJBelt.white).toNot.beLessThan(BJJBelt.blue)
        }
    }
}
