import XCTest
@testable import Moocher

final class BeFalsySpec: XCTestCase {    
    func testToBeFalsy() {
        expect(false).to.beFalsy()
        
        expectFailure("true should not be falsy") {
            expect(true).to.beFalsy()
        }
        
        expect(true).toNot.beFalsy()
    }
    
    func testToNotBeFalsy() {
        expect(true).toNot.beFalsy()
        
        expectFailure("false should not not be falsy") {
            expect(false).toNot.beFalsy()
        }
        
        expect(true).toNot.beFalsy()
    }
}
