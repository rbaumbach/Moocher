import XCTest
@testable import Moocher

final class ConformTo: XCTestCase {
    var dog: Dog!
    var grizzlyBear: GrizzlyBear!
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
        
        grizzlyBear = GrizzlyBear()
    }
    
    func testToConformTo() {
        expect(dog).to.conformTo(Wolf.self)
        
        XCTExpectFailure("true should not not be truthy") {
            expect(dog).to.conformTo(Bear.self)
        }
    }
    
    func testToNotConformTo() {
        expect(dog).toNot.conformTo(Bear.self)
        
        XCTExpectFailure("true should not not be truthy") {
            expect(grizzlyBear).toNot.conformTo(Bear.self)
        }
    }
}
    
