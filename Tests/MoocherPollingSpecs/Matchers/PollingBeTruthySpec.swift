import XCTest
@testable import MoocherPolling

final class PollingBeTruthySpec: XCTestCase {
    let longRunningTaskSimulator = LongRunningTaskSimulator()
    
    var isTruthy = true
    var isFalsy = false
    
    var isTruthyOptional: Bool? = true
    var isFalsyOptional: Bool? = false
    
    func testBeTruthy() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isFalsy = true
        }

        expect(self.isFalsy).toSomeday.beTruthy()
    }
    
    func testBeTruthyFailure() {
        longRunningTaskSimulator.longRunningTask { }

        expectFailure(self.isFalsy).toSomeday.beTruthy()
    }
    
    func testBeTruthyOptional() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isFalsyOptional = true
        }

        expect(self.isFalsyOptional).toSomeday.beTruthy()
    }
    
    func testBeTruthyOptionalFailure() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isFalsyOptional = nil
        }

        expectFailure(self.isFalsyOptional).toSomeday.beTruthy()
    }
    
    func testBeTruthyOptionalNever() {
        longRunningTaskSimulator.longRunningTask { }

        expect(self.isFalsyOptional).toNever.beTruthy()
    }
    
    func testBeTruthyOptionalNeverFailure() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.isFalsyOptional = true
        }

        expectFailure(self.isFalsyOptional).toNever.beTruthy()
    }
}
