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
        
        XCTExpectFailure("expect should have proper closure structure") {
            expect({ try self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError()
        }
        
        XCTExpectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).to.throwError()
        }
    }
    
    func testToNotThrowError() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).toNot.throwError()
        
        XCTExpectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).toNot.throwError()
        }
    }
    
    func testToThrowErrorWithErrorHandler() {
        expect { try _ = self.dog.bark(shouldThroughExceptionalBark: true) }
            .to.throwError { error in
                expect(error as? BarkException).to.equal(.earShrikingBark)
        }
    }
    
    // TODO: Determine if "toNot" makes sense for an error handler
    // The current implementation does not use the errorHandler function at all
    // with the toNot scenario
    
    func testToNotThrowErrorWithErrorHandler() {
        expect { try _ = self.dog.bark(shouldThroughExceptionalBark: false) }
            .toNot.throwError { error in
                expect(error as? BarkException).to.equal(.earShrikingBark)
        }
    }
    
    func testToThrowErrorWithSpecificError() {
        expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(specificError: BarkException.earShrikingBark)
        
        XCTExpectFailure("dog should not throw error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).to.throwError(specificError: BarkException.deafeningBark)
        }
        
        XCTExpectFailure("dog should not throw deafeningBark error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: true) }).to.throwError(specificError: BarkException.deafeningBark)
        }
    }
    
    // TODO: Determine if "toNot" makes sense for a specific error
    // The current implementation immediately throws and XCAssert error if error
    // is not thrown by input function
    
    func testToNotThrowErrorWithSpecificError() {
        XCTExpectFailure("dog should not throw any error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).toNot.throwError(specificError: BarkException.earShrikingBark)
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
    
    // TODO: Determine if "toNot" makes sense for a specific error
    // The current implementation immediately throws and XCAssert error if error
    // is not thrown by input function
    
    func testToNotThrowErrorWithErrorType() {
        XCTExpectFailure("dog should not throw any error") {
            expect({ try _ = self.dog.bark(shouldThroughExceptionalBark: false) }).toNot.throwError(specificError: BarkException.earShrikingBark)
        }
    }
}
