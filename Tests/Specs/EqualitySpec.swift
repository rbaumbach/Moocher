import XCTest
@testable import Moocher

final class Specs: XCTestCase {
    func testEquality() {
        expect(99).to.equal(99)
//        expect(99).to.equal(100)
        
        expect(99).toNot.equal(100)
//        expect(99).toNot.equal(99)
    }
    
    func testBeNil() {
        var somethingNil: Int?
        expect(somethingNil).to.beNil()
//        expect(somethingNil).toNot.beNil()
        
        let somethingNonNil: Int? = 99
        expect(somethingNonNil).toNot.beNil()
//        expect(somethingNonNil).to.beNil()
    }
}
