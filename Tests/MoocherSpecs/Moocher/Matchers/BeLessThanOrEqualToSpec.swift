import XCTest
@testable import Moocher

final class BeLessThanOrEqualToSpec: XCTestCase {
    func testToBeLessThanOrEqualTo() {
        expect(9).to.beLessThanOrEqualTo(9)
        expect(9).to.beLessThanOrEqualTo(10)
        expect(BJJBelt.white).to.beLessThanOrEqualTo(BJJBelt.white)
        expect(BJJBelt.white).to.beLessThanOrEqualTo(BJJBelt.blue)
        
        expectFailure("9 should not be less than or equal to 8") {
            expect(9).to.beLessThanOrEqualTo(8)
        }
        
        expectFailure("black belt should not be less than or equal to white belt") {
            expect(BJJBelt.black).to.beLessThanOrEqualTo(BJJBelt.white)
        }
    }
    
    func testToNotBeLessThanOrEqualTo() {
        expect(9).toNot.beLessThanOrEqualTo(8)
        expect(BJJBelt.blue).toNot.beLessThanOrEqualTo(BJJBelt.white)
        
        expectFailure("9 should be less than or equal to 10") {
            expect(9).toNot.beLessThanOrEqualTo(10)
        }
        
        expectFailure("white belt should be less than or equal to blue belt") {
            expect(BJJBelt.white).toNot.beLessThanOrEqualTo(BJJBelt.blue)
        }
    }
}
