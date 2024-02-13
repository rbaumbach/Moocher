import XCTest
@testable import MoocherPolling

final class PollingBeNilSpec: XCTestCase {
    let longRunningTaskSimulator = LongRunningTaskSimulator()
    
    var number: Int?
    var eventuallyNilNumber: Int?
    
    override func setUp() {
        super.setUp()
        
        number = nil
    }
    
    func testToSomedayBeNil() {
        self.number = 100
        
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.number = nil
        }
                
        expect(self.number).toSomeday.beNil()
    }
    
    func testToSomedayBeNilWithOptionalNotGivenAValue() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.eventuallyNilNumber = nil
        }
                
        expect(self.eventuallyNilNumber).toSomeday.beNil()
    }
    
    // TBD: Create a mechanism to test when something eventually fails
    
//    func testToSomedayBeNilFailure() {
//        self.number = 100
//        
//        longRunningTaskSimulator.longRunningTask { [weak self] in
//            self?.number = 200
//        }
//
//        expect(self.number).toSomeday.beNil()
//    }
    
    func testToNeverBeNil() {
        self.number = 100

        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.number = 200
        }

        expect(self.number).toNever.beNil()
    }
    
//    func testToNeverBeNilFailure() {
//        self.number = 100
//
//        longRunningTaskSimulator.longRunningTask { [weak self] in
//            self?.number = nil
//        }
//
//        expect(self.number).toNever.beNil()
//    }
}
