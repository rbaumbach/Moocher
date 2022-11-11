import XCTest
@testable import Moocher

final class Specs: XCTestCase {
    var somethingNil: Int?
    var somethingNonNil: Int!
    
    override func setUp() {
        super.setUp()
        
        somethingNonNil = 99
    }
    
    func testBeNil() {
        expect(somethingNil).to.beNil()
//        expect(somethingNil).toNot.beNil()
        
        expect(somethingNonNil).toNot.beNil()
//        expect(somethingNonNil).to.beNil()
    }
    
    func testBeInstance() {
        let dog1 = Dog()
        let dog2 = dog1
        
        expect(dog1).to.beInstance(dog2)
        
//        expect(99).to.beInstance(dog1)
//        expect(99).toNot.beInstance(dog1) // This passes because Int gets converted to NSNumber =(
        
        let dog3 = Dog()
        expect(dog1).toNot.beInstance(dog3)
        
//        expect(dog1).to.beInstance(dog3)
        
//        let fish1 = Fish()
//        let fish2 = Fish()
//
//        expect(fish1).to.beInstance(fish2)
    }
    
    func testConformTo() {
        let dog = Dog()
        
        let grizzyBear = GrizzlyBear()
                
        expect(dog).to.conformTo(Wolf.self)
        
//        expect(dog).to.conformTo(Bear.self)
        
        expect(dog).toNot.conformTo(Bear.self)
        
//        expect(grizzyBear).toNot.conformTo(Bear.self)
    }
    
    func testEqual() {
        expect(99).to.equal(99)
        
        expect(somethingNil).to.equal(nil)
        
//        expect(99).to.equal(100)
        
        expect(99).toNot.equal(100)
        expect(99).toNot.equal(nil)
        
//        expect(99).toNot.equal(99)
    }

    func testBeTruthy() {
        expect(true).to.beTruthy()

//        expect(somethingNil).to.beTruthy()
//
//        expect(99).to.beTruthy()
//        expect(false).to.beTruthy()
        
        expect(false).toNot.beTruthy()
        
//        expect(true).toNot.beTruthy()
    }
    
    func testBeFalsy() {
        expect(false).to.beFalsy()
        
//        expect(somethingNil).to.beFalsy()
//
//        expect(99).to.beFalsy()
//        expect(true).to.beFalsy()
        
        expect(true).toNot.beFalsy()
        
//        expect(false).toNot.beFalsy()
    }
}
