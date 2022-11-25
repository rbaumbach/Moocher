import XCTest
@testable import Moocher

final class BeInstanceOfSpec: XCTestCase {
    var dog1: Dog!
    var dog2: Dog!
    var dog3: Dog!
    
    override func setUp() {
        super.setUp()
        
        dog1 = Dog()
        dog2 = dog1
        dog3 = Dog()
    }
    
    func testToBeInstanceOf() {
        expect(dog1).to.beInstanceOf(dog2)
        
        expectFailure("dog1 should not be instance of dog3") {
            expect(dog1).to.beInstanceOf(dog3)
        }
    }
    
    func testToNotBeInstanceOf() {
        expect(dog1).toNot.beInstanceOf(dog3)
        
        expectFailure("dog1 should be instance of dog2") {
            expect(dog1).toNot.beInstanceOf(dog2)
        }
    }
}
