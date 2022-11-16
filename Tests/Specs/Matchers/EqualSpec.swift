import XCTest
@testable import Moocher

final class EqualSpec: XCTestCase {
    var dog: Dog!
    var grizzlyBear: GrizzlyBear!
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
        
        grizzlyBear = GrizzlyBear()
    }
    
    func testToEqual() {
        expect(99).to.equal(99)
        
        XCTExpectFailure("99 should not equal 100") {
            expect(99).to.equal(100)
        }
    }
    
    func testToNotEqual() {
        expect(99).toNot.equal(100)
        
        XCTExpectFailure("99 should equal 99") {
            expect(99).toNot.equal(99)
        }
    }
    
    func testToEqualWithAccuracy() {
        expect(9.9).to.equal(9.9, within: 0.1)
        
        XCTExpectFailure("9.9 should not equal 10.9 within 0.1") {
            expect(9.9).to.equal(10.9, within: 0.1)
        }
    }
    
    func testToNotEqualWithAccuracy() {
        expect(9.9).to.equal(9.9, within: 0.1)
        
        XCTExpectFailure("9.9 should equal 9.9 within 0.1") {
            expect(9.9).toNot.equal(9.9, within: 0.1)
        }
    }
}
    
