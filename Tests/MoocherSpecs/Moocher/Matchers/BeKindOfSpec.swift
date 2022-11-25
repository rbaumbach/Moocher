import XCTest
@testable import Moocher

final class BeKindOfSpec: XCTestCase {
    var dog: Dog!
    var fish: Fish!
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
        fish = Fish()
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
}
