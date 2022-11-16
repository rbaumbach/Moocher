import XCTest
@testable import Moocher

final class BeNilSpec: XCTestCase {
    var somethingNil: Int?
    var somethingNonNil: Int!
    
    override func setUp() {
        super.setUp()
        
        somethingNonNil = 99
    }
    
    func testToBeNil() {
        expect(somethingNil).to.beNil()
                
        XCTExpectFailure("somethingNonNil should not be nil") {
            expect(somethingNonNil).to.beNil()
        }
    }
    
    func testToNotBeNil() {
        expect(somethingNonNil).toNot.beNil()
        
        XCTExpectFailure("somethingNil should not be nil") {
            expect(somethingNil).toNot.beNil()
        }
    }
}
    
