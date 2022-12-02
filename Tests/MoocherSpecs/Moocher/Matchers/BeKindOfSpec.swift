import XCTest
@testable import Moocher

final class BeKindOfSpec: XCTestCase {
    var dog: Dog!
    var fish: Fish!
    
    var optionalDog: Dog?
    var optionalNilDog: Dog?
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
        fish = Fish()
        
        optionalDog = Dog()
    }
        
    func testToBeKindOf() {
        expect(fish).to.beKindOf(Fish.self)
        expect(dog).to.beKindOf(WildAnimal.self)
        
        expectFailure("dog should not be a Fish") {
            expect(dog).to.beKindOf(Fish.self)
        }
        
        expectFailure("dog should not be a Bear") {
            expect(dog).to.beKindOf(Bear.self)
        }
    }
    
    func testToBeKindOfWithOptional() {
        expect(optionalDog).to.beKindOf(Dog.self)
        
        expectFailure("optionalDog should not be a Bear") {
            expect(optionalDog).to.beKindOf(Bear.self)
        }
    }
    
    func testToBeKindOfWithOptionalNil() {
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).to.beKindOf(Dog.self)
        }
        
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).to.beKindOf(Bear.self)
        }
    }
    
    func testToNotBeKindOf() {
        expect(fish).toNot.beKindOf(WildAnimal.self)
        expect(dog).toNot.beKindOf(Bear.self)
        
        expectFailure("dog should be a wolf") {
            expect(dog).toNot.beKindOf(Wolf.self)
        }
        
        expectFailure("dog should be a WildAnimal") {
            expect(dog).toNot.beKindOf(WildAnimal.self)
        }
    }
    
    func testToNotBeKindOfWithOptional() {
        expect(optionalDog).toNot.beKindOf(Bear.self)
        
        expectFailure("optionalDog should be a WildAnimal") {
            expect(optionalDog).toNot.beKindOf(WildAnimal.self)
        }
    }
    
    func testToNotBeKindOfWithOptionalNil() {
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).toNot.beKindOf(Dog.self)
        }
        
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).toNot.beKindOf(Bear.self)
        }
    }
}
