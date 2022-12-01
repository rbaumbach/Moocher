import XCTest
@testable import MoocherPolling

final class PollingBeNilSpec: XCTestCase {
    var number: Int?
    var longRunningTaskSimulator = LongRunningTaskSimulator()
    
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
        var localNumber: Int?
        
        longRunningTaskSimulator.longRunningTask {
            localNumber = nil
        }
                
        expect(localNumber).toSomeday.beNil()
    }
    
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
