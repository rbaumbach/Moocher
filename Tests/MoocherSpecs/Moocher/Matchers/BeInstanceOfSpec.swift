import XCTest
@testable import Moocher

final class BeInstanceOfSpec: XCTestCase {
    var dog1: Dog!
    var dog2: Dog!
    var dog3: Dog!
    
    var optionalDog: Dog?
    var anotherOptionalDog: Dog?
    var yetAnotherOptionalDog: Dog?
    
    var nilDog: Dog?
    var anotherNilDog: Dog?
    var yetAnotherNilDog: Dog?
    
    override func setUp() {
        super.setUp()
        
        dog1 = Dog()
        dog2 = dog1
        dog3 = Dog()
        
        optionalDog = Dog()
        anotherOptionalDog = optionalDog
        yetAnotherOptionalDog = Dog()
        
        anotherNilDog = nilDog
    }
    
    func testToBeInstanceOf() {
        expect(dog1).to.beInstanceOf(dog2)
        
        expectFailure("dog1 should not be instance of dog3") {
            expect(dog1).to.beInstanceOf(dog3)
        }
    }
        
    func testToBeInstanceOfWithOptional() {
        expect(optionalDog).to.beInstanceOf(anotherOptionalDog)
        
        expectFailure("optionalDog should not be instance of yetAnotherOptionalDog") {
            expect(optionalDog).to.beInstanceOf(yetAnotherOptionalDog)
        }
    }
    
    func testToBeInstanceOfWithOptionalNils() {
        expect(nilDog).to.beInstanceOf(anotherNilDog)
        
        // Note: Since they both point to nil, they are "technically"
        // identical
        
        expect(nilDog).to.beInstanceOf(yetAnotherNilDog)
    }
    
    func testToNotBeInstanceOf() {
        expect(dog1).toNot.beInstanceOf(dog3)
        
        expectFailure("dog1 should be instance of dog2") {
            expect(dog1).toNot.beInstanceOf(dog2)
        }
    }
    
    func testToNotBeInstanceOfWithOptionalNils() {
        // Note: Since they both point to nil, they are "technically"
        // identical and will always fail with ToNot
        
        expectFailure("both are identical since they are both nil") {
            expect(nilDog).toNot.beInstanceOf(anotherNilDog)
        }
        
        expectFailure("both are identical since they are both nil") {
            expect(nilDog).toNot.beInstanceOf(yetAnotherNilDog)
        }
    }
}
