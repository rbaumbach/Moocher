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
    
    func testBeInstanceOf() {
//        let doggy: Dog? = nil
//
//        expect(doggy).to.beInstanceOf(Dog())
        
        let dog1 = Dog()
        let dog2 = dog1
        
        expect(dog1).to.beInstanceOf(dog2)
        
//        expect(99).to.beInstanceOf(dog1)
//        expect(99).toNot.beInstanceOf(dog1) // This passes because Int gets converted to NSNumber =(
        
        let dog3 = Dog()
        expect(dog1).toNot.beInstanceOf(dog3)
        
//        expect(dog1).to.beInstanceOf(dog3)
        
//        let fish1 = Fish()
//        let fish2 = Fish()
//
//        expect(fish1).to.beInstanceOf(fish2)
    }
    
    func testKindOf() {
//        let doggy: Dog? = nil
//
//        expect(doggy).to.beKindOf(Dog.self)
        
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
//        let doggy: Dog? = nil
//
//        expect(doggy).to.conformTo(Wolf.self)
        
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
    
    func testEqualWithAccuracy() {
//        let floaty: Float? = nil
//
//        expect(floaty).toNot.equal(9.9, within: 0.1)
        
        expect(9.9).to.equal(9.9, within: 0.1)
        
//        expect(9.9).toNot.equal(9.9, within: 0.1)
    }

    func testBeTruthy() {
//        var doggy: Dog? = nil
//
//        expect(doggy).to.beTruthy()
//
//        doggy = Dog()
//
//        expect(doggy).to.beTruthy()
        
        expect(true).to.beTruthy()

//        expect(somethingNil).to.beTruthy()
//
//        expect(99).to.beTruthy()
//        expect(false).to.beTruthy()
        
        expect(false).toNot.beTruthy()
        
//        expect(true).toNot.beTruthy()
    }
    
    func testBeFalsy() {
//        var doggy: Dog? = nil
//
//        expect(doggy).to.beFalsy()
//
//        doggy = Dog()
//
//        expect(doggy).to.beFalsy()
        
        expect(false).to.beFalsy()
        
//        expect(somethingNil).to.beFalsy()
//
//        expect(99).to.beFalsy()
//        expect(true).to.beFalsy()
        
        expect(true).toNot.beFalsy()
        
//        expect(false).toNot.beFalsy()
    }
    
    func testBeLessThan() {
//        let bjjBelt: BJJBelt? = nil
//
//        expect(bjjBelt).to.beLessThan(BJJBelt.blue)
        
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
//        let bjjBelt: BJJBelt? = nil
//
//        expect(bjjBelt).to.beLessThanOrEqualTo(BJJBelt.blue)

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
//        let bjjBelt: BJJBelt? = nil
//
//        expect(bjjBelt).to.beGreaterThan(BJJBelt.blue)
        
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
//        let bjjBelt: BJJBelt? = nil
//
//        expect(bjjBelt).to.beGreaterThanOrEqualTo(BJJBelt.blue)
        
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
    
    func testThrowErrorWithErrorHandler() {
//        var doggy: Dog? = nil
//        
//        expect(doggy).to.throwError()
        
        let dog = Dog()
        
        // Note: This expect has a function type of () throws-> String
        // instead of () throws -> Void
        
//        expect({ try dog.bark(shouldThroughExceptionalBark: true) }).to.throwError()
        
        expect({ try _ = dog.bark(shouldThroughExceptionalBark: true) }).to.throwError()
        
        expect { try _ = dog.bark(shouldThroughExceptionalBark: true) }
            .to.throwError { error in
                expect(error as? BarkException).to.equal(.earShrikingBark)
        }
        
//        expect({ try _ = dog.bark(shouldThroughExceptionalBark: false) }).to.throwError()
        
        expect({ try _ = dog.bark(shouldThroughExceptionalBark: false) }).toNot.throwError()
        
//        expect { try _ = dog.bark(shouldThroughExceptionalBark: true) }
//            .toNot.throwError { error in
//                expect(error as? BarkException).to.equal(.earShrikingBark)
//        }
        
//        expect({ try _ = dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError()
    }
    
    func testThrowErrorWithSpecificError() {
//        var doggy: Dog? = nil
//
//        expect(doggy).to.throwError(specificError: BarkException.earShrikingBark)
//
//        expect({ try Dog().bark(shouldThroughExceptionalBark: true) }).to.throwError(specificError: BarkException.earShrikingBark)
        
        let dog = Dog()
        
        expect({ try _ = dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(specificError: BarkException.earShrikingBark)
        
//        expect({ try _ = dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(specificError: BarkException.deafeningBark)
//
//        expect({ try _ = dog.bark(shouldThroughExceptionalBark: false) }).to.throwError(specificError: BarkException.earShrikingBark)
//
//        expect({ try _ = dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError(specificError: BarkException.earShrikingBark)
    }
    
    func testThrowErrorWithErrorType() {
//        var doggy: Dog? = nil
//
//        expect(doggy).to.throwError(errorType: BarkException.self)
//
//        expect({ try Dog().bark(shouldThroughExceptionalBark: true) }).to.throwError(errorType: BarkException.self)
        
        let dog = Dog()
        
        expect({ try _ = dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(errorType: BarkException.self)
        
//        expect({ try _ = dog.bark(shouldThroughExceptionalBark: false) }).to.throwError(errorType: BarkException.self)
//
//        expect({ try _ = dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError(errorType: BarkException.self)
    }
    
    func testIsEmptyCollection() {
//        let nilArray: [Int]? = nil
//
//        expect(nilArray).to.beEmpty()
        
        let arr1: [Int] = []
        
        expect(arr1).to.beEmpty()
        
        let arr2 = [1,2]
        
//        expect(arr2).to.beEmpty()
        
        expect(arr2).toNot.beEmpty()
        
//        expect(arr1).toNot.beEmpty()
    }
    
    func testIsEmptyString() {
//        let nilString: String? = nil
//
//        expect(nilString).to.beEmpty()
        
        expect("").to.beEmpty()
        
//        expect("Burrito").to.beEmpty()
        
        expect("Taco").toNot.beEmpty()
        
//        expect("").toNot.beEmpty()
    }
}
