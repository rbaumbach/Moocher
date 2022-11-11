import XCTest
@testable import Moocher

final class Specs: XCTestCase {
    var somethingNil: Int?
    var somethingNonNil: Int!
    
    override func setUp() {
        super.setUp()
        
        somethingNonNil = 99
    }
    
    func testEquality() {
        expect(99).to.equal(99)
        
        expect(somethingNil).to.equal(nil)
        
//        expect(99).to.equal(100)
        
        expect(99).toNot.equal(100)
        expect(99).toNot.equal(nil)
        
//        expect(99).toNot.equal(99)
    }
    
    func testBeNil() {
        expect(somethingNil).to.beNil()
//        expect(somethingNil).toNot.beNil()
        
        expect(somethingNonNil).toNot.beNil()
//        expect(somethingNonNil).to.beNil()
    }
    
    func testBeTruthy() {
        expect(true).to.beTruthy()

//        expect(somethingNil).to.beTruthy()
//
//        expect(99).to.beTruthy()
//        expect(false).to.beTruthy()
    }
    
    func testBeFalsy() {
        expect(false).to.beFalsy()
        
//        expect(somethingNil).to.beFalsy()
//
//        expect(99).to.beFalsy()
//        expect(true).to.beFalsy()
    }
}
