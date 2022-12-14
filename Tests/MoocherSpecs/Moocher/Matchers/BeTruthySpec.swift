import XCTest
@testable import Moocher

final class BeTruthySpec: XCTestCase {
    var somethingNil: Int?
    var somethingNonNil: Int!
    
    override func setUp() {
        super.setUp()
        
        somethingNonNil = 99
    }
    
    func testToBeTruthy() {
        expect(true).to.beTruthy()
        
        expectFailure("false should not be truthy") {
            expect(false).to.beTruthy()
        }
    }
    
    func testToNotBeTruthy() {
        expect(false).toNot.beTruthy()
        
        expectFailure("true should not not be truthy") {
            expect(true).toNot.beTruthy()
        }
    }
}
