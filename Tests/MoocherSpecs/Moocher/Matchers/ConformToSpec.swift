import XCTest
@testable import Moocher

final class ConformTo: XCTestCase {
    var dog: Dog!
    var grizzlyBear: GrizzlyBear!
    
    var optionalDog: Dog?
    var optionalNilDog: Dog?
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
        
        grizzlyBear = GrizzlyBear()
        
        optionalDog = Dog()
    }
    
    func testToConformTo() {
        expect(dog).to.conformTo(Wolf.self)
        
        expectFailure("true should not not be truthy") {
            expect(dog).to.conformTo(Bear.self)
        }
    }
    
    func testToConformToWithOptional() {
        expect(optionalDog).to.conformTo(Dog.self)
        
        expectFailure("optionalDog should not be a Bear") {
            expect(optionalDog).to.conformTo(Bear.self)
        }
    }
    
    func testToConformToWithOptionalNil() {
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).to.conformTo(Dog.self)
        }
        
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).to.conformTo(Bear.self)
        }
    }
    
    func testToNotConformTo() {
        expect(dog).toNot.conformTo(Bear.self)
        
        expectFailure("true should not not be truthy") {
            expect(grizzlyBear).toNot.conformTo(Bear.self)
        }
    }
    
    func testToNotConformToWithOptional() {
        expect(optionalDog).toNot.conformTo(Bear.self)
        
        expectFailure("optionalDog should be a Wolf") {
            expect(optionalDog).toNot.conformTo(Wolf.self)
        }
    }
    
    func testToNotConformToWithOptionalNil() {
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).toNot.conformTo(Dog.self)
        }
        
        expectFailure("optionalDog is nil") {
            expect(optionalNilDog).toNot.conformTo(Bear.self)
        }
    }
}
    
