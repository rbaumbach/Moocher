import XCTest
@testable import MoocherPolling

final class PollingBeFaslySpec: XCTestCase {
    let longRunningTaskSimulator = LongRunningTaskSimulator()
    
    var isTruthy = true
    var isFalsy = false
    
    var isTruthyOptional: Bool? = true
    var isFalsyOptional: Bool? = false
    
    func testBeFalsy() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isTruthy = false
        }

        expect(self.isTruthy).toSomeday.beFalsy()
    }
    
    func testBefalsyFailure() {
        longRunningTaskSimulator.longRunningTask { }

        expectFailure(self.isTruthy).toSomeday.beFalsy()
    }
    
    func testBeFalsyOptional() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isTruthyOptional = false
        }

        expect(self.isTruthyOptional).toSomeday.beFalsy()
    }
    
    func testBeFalsyOptionalFailure() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isTruthyOptional = nil
        }

        expectFailure(self.isTruthyOptional).toSomeday.beFalsy()
    }
    
    func testBeFalsyOptionalNever() {
        longRunningTaskSimulator.longRunningTask { }

        expect(self.isTruthyOptional).toNever.beFalsy()
    }
    
    func testBeFalsyOptionalNeverFailure() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isTruthyOptional = false
        }

        expectFailure(self.isTruthyOptional).toNever.beFalsy()
    }
}
