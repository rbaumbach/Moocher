import XCTest
@testable import Moocher

final class ThrowSpec: XCTestCase {
    var dog: Dog!
    var grizzlyBear: GrizzlyBear!
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
        
        grizzlyBear = GrizzlyBear()
    }
    
    //============
    
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
}
