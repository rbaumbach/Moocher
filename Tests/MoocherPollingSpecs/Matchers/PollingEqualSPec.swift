import XCTest
@testable import MoocherPolling

final class PollingEqualSpec: XCTestCase {
    var optionalNumber: Int?
    var dog: String!
    var longRunningTaskSimulator = LongRunningTaskSimulator()
    
    override func setUp() {
        super.setUp()
        
        optionalNumber = nil
    }
    
    func testExpectToSomedayEqual() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.dog = "Pancho"
        }
                
        expect(self.dog).toSomeday.equal("Pancho")
    }
    
    func testExpectToSomedayEqualOptional() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.optionalNumber = 77
        }
                
        expect(self.optionalNumber).toSomeday.equal(77)
    }
        
    func testExpectToSomedayEqualFailure() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.optionalNumber = 77
        }

        expectFailure(self.optionalNumber).toSomeday.equal(99)
    }
    
    func testExpectToNeverEqual() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.optionalNumber = 77
        }
                
        expect(self.optionalNumber).toNever.equal(55)
    }
    
    func testExpectToNeverEqualFailure() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.optionalNumber = 77
        }

        expectFailure(self.optionalNumber).toNever.equal(77)
    }
}
