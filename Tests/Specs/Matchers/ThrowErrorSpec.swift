import XCTest
@testable import Moocher

final class ThrowErrorSpec: XCTestCase {
    var dog: Dog!
    var grizzlyBear: GrizzlyBear!
    
    override func setUp() {
        super.setUp()
        
        dog = Dog()
    }
    
    func testToThrowError() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError()
        
        // Note: This expect has a function type of () throws-> String
        // instead of () throws -> Void
        
        expectFailure("expect should have proper closure structure") {
            expect({ try self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError()
        }
        
        expectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).to.throwError()
        }
    }
    
    func testToNotThrowError() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).toNot.throwError()
        
        expectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError()
        }
    }
    
    func testToThrowErrorWithErrorHandler() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) })
            .to.throwError { error in
                expect(error as? BarkException).to.equal(.earShrikingBark)
        }
    }

    // Note: Since this scenario doesn't really make sense, an
    // XCTFail is given to the user.
    
    func testToNotThrowErrorWithErrorHandler() {
        XCTExpectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) })
                .toNot.throwError { error in
                    expect(error as? BarkException).to.equal(.earShrikingBark)
            }
        }
    }
    
    func testToThrowErrorWithSpecificError() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(specificError: BarkException.earShrikingBark)
        
        expectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).to.throwError(specificError: BarkException.deafeningBark)
        }
        
        expectFailure("dog should not throw deafeningBark error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(specificError: BarkException.deafeningBark)
        }
    }
    
    func testToNotThrowErrorWithSpecificError() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).toNot.throwError(specificError: BarkException.earShrikingBark)
        
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError(specificError: MeowException.purrr)
        
        expectFailure("dog should throw BarkException.earShrinkingBark") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError(specificError: BarkException.earShrikingBark)
        }
    }
    
    func testToThrowErrorWithErrorType() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(errorType: BarkException.self)
        
        XCTExpectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).to.throwError(errorType: BarkException.self)
        }
        
        XCTExpectFailure("dog should throw BarkException error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(errorType: MeowException.self)
        }
    }
    
    func testToNotThrowErrorWithErrorType() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).toNot.throwError(errorType: BarkException.self)
        
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError(errorType: MeowException.self)
        
        XCTExpectFailure("dog should throw BarkException") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError(errorType: BarkException.self)
        }
    }
}
