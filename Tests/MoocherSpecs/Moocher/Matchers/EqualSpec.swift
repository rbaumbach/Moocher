import XCTest
@testable import Moocher

final class EqualSpec: XCTestCase {
    var dog: Dog!
    var grizzlyBear: GrizzlyBear!
    var optionalFish: Fish?
    var optionalNilFish: Fish?
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
        
        grizzlyBear = GrizzlyBear()
        
        optionalFish = Fish()
    }
    
    func testToEqual() {
        expect(99).to.equal(99)
        
        expectFailure("99 should not equal 100") {
            expect(99).to.equal(100)
        }
    }
    
    func testToEqualWithOptional() {
        var anotherFish = Fish()
        
        expect(optionalFish).to.equal(anotherFish)
        
        expectFailure("optionalFish does not equal anotherFish") {
            anotherFish.type = "Sturgeon"
            
            expect(optionalFish).to.equal(anotherFish)
        }
    }
    
    func testToEqualWithOptionalNil() {
        let anotherNilFish: Fish? = nil
        
        expect(optionalNilFish).to.equal(anotherNilFish)
        
        expectFailure("optionalNilFish is nil") {
            expect(optionalNilFish).to.equal(Fish())
        }
    }
    
    func testToNotEqual() {
        expect(99).toNot.equal(100)
        
        expectFailure("99 should equal 99") {
            expect(99).toNot.equal(99)
        }
    }
    
    func testToNotEqualWithOptional() {
        var anotherFish = Fish()
        anotherFish.type = "Sturgeon"
        
        expect(optionalFish).toNot.equal(anotherFish)
        
        expectFailure("optionalFish is equal to a new fish") {
            expect(optionalFish).toNot.equal(Fish())
        }
    }
    
    func testToNotEqualWithOptionalNil() {
        let anotherFish = Fish()
        
        expect(optionalNilFish).toNot.equal(anotherFish)
        
        expectFailure("optionalFish is equal to a new fish") {
            let anotherNilFish: Fish? = nil
            
            expect(optionalNilFish).toNot.equal(anotherNilFish)
        }
    }
    
    func testToEqualWithAccuracy() {
        expect(9.9).to.equal(9.9, within: 0.1)
        
        expectFailure("9.9 should not equal 10.9 within 0.1") {
            expect(9.9).to.equal(10.9, within: 0.1)
        }
    }
        
    func testToEqualWithAccuracyWithOptional() {
        let optionalDouble: Double? = 9.9
        
        expect(optionalDouble).to.equal(9.9, within: 0.1)
        
        expectFailure("optional 9.9 should not equal 10.9 within 0.1") {
            expect(optionalDouble).to.equal(10.9, within: 0.1)
        }
    }
        
    func testToEqualWithAccuracyWithOptionalNil() {
        let optionalNilDouble: Double? = nil
        
        expectFailure("optionalNilFish is nil") {
            expect(optionalNilDouble).to.equal(0.0, within: 0.1)
        }
    }
    
    func testToNotEqualWithAccuracy() {
        expect(9.9).to.equal(9.9, within: 0.1)
        
        expectFailure("9.9 should equal 9.9 within 0.1") {
            expect(9.9).toNot.equal(9.9, within: 0.1)
        }
    }
    
    // finish
    
    func testToNotEqualWithAccuracyWithOptional() {
        var anotherFish = Fish()
        anotherFish.type = "Swordfish"
        
        expect(optionalFish).toNot.equal(anotherFish)
        
        expectFailure("optionalFish is equal to a new fish") {
            expect(optionalFish).toNot.equal(Fish())
        }
    }
    
    func testToNotEqualWithAccuracyWithOptionalNil() {
        expect(optionalNilFish).toNot.equal(Fish())
        
        expectFailure("optionalNilFish is nil") {
            let anotherFish: Fish? = nil
            
            expect(optionalNilFish).toNot.equal(anotherFish)
        }
    }
}
    
