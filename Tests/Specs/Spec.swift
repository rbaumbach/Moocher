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
    
    func testKindOf() {
        let dog = Dog()
        let fish = Fish()
        
        expect(fish).to.beKindOf(Fish.self)
        expect(dog).to.beKindOf(WildAnimal.self)
        
//        expect(dog).to.beKindOf(Fish.self)
//        expect(dog).to.beKindOf(Bear.self)
        
        expect(fish).toNot.beKindOf(WildAnimal.self)
        expect(dog).toNot.beKindOf(Bear.self)
        
//        expect(dog).toNot.beKindOf(Wolf.self)
//        expect(dog).toNot.beKindOf(WildAnimal.self)
    }
    
    func testConformTo() {
        let dog = Dog()
        
//        let grizzyBear = GrizzlyBear()
                
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
    
    func testBeLessThan() {
        expect(9).to.beLessThan(10)
        expect(BJJBelt.white).to.beLessThan(BJJBelt.blue)
        
//        expect(9).to.beLessThan(9)
//        expect(BJJBelt.white).to.beLessThan(BJJBelt.white)
        
        expect(9).toNot.beLessThan(8)
        expect(9).toNot.beLessThan(9)
        expect(BJJBelt.blue).toNot.beLessThan(BJJBelt.white)
        
//        expect(9).toNot.beLessThan(10)
//        expect(BJJBelt.white).toNot.beLessThan(BJJBelt.blue)
    }
    
    func testBeLessThanOrEqualTo() {
        expect(9).to.beLessThanOrEqualTo(9)
        expect(9).to.beLessThanOrEqualTo(10)
        expect(BJJBelt.white).to.beLessThanOrEqualTo(BJJBelt.white)
        expect(BJJBelt.white).to.beLessThanOrEqualTo(BJJBelt.blue)
        
//        expect(9).to.beLessThanOrEqualTo(8)
//        expect(BJJBelt.black).to.beLessThanOrEqualTo(BJJBelt.white)
        
        expect(9).toNot.beLessThanOrEqualTo(8)
        expect(BJJBelt.blue).toNot.beLessThanOrEqualTo(BJJBelt.white)
        
//        expect(9).toNot.beLessThanOrEqualTo(10)
//        expect(BJJBelt.white).toNot.beLessThanOrEqualTo(BJJBelt.blue)
    }
    
    func testBeGreaterThan() {
        expect(10).to.beGreaterThan(9)
        expect(BJJBelt.black).to.beGreaterThan(BJJBelt.purple)
        
//        expect(9).to.beGreaterThan(9)
//        expect(BJJBelt.white).to.beGreaterThan(BJJBelt.white)
        
        expect(8).toNot.beGreaterThan(9)
        expect(9).toNot.beGreaterThan(9)
        expect(BJJBelt.blue).toNot.beGreaterThan(BJJBelt.purple)
        
//        expect(10).toNot.beGreaterThan(9)
//        expect(BJJBelt.brown).toNot.beGreaterThan(BJJBelt.blue)
    }
    
    func testBeGreaterThanOrEqualTo() {
        expect(10).to.beGreaterThanOrEqualTo(9)
        expect(10).to.beGreaterThanOrEqualTo(10)
        expect(BJJBelt.black).to.beGreaterThanOrEqualTo(BJJBelt.black)
        
//        expect(9).to.beGreaterThanOrEqualTo(10)
//        expect(BJJBelt.white).to.beGreaterThanOrEqualTo(BJJBelt.red)
        
        expect(8).toNot.beGreaterThanOrEqualTo(9)
        expect(BJJBelt.blue).toNot.beGreaterThanOrEqualTo(BJJBelt.purple)
        
//        expect(10).toNot.beGreaterThanOrEqualTo(9)
//        expect(BJJBelt.brown).toNot.beGreaterThanOrEqualTo(BJJBelt.blue)
    }
}
