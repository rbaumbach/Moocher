import XCTest
@testable import Moocher
@testable import MoocherPolling

final class ExpectPollingSpec: XCTestCase {
    var number: Int?
    
    func testExpectPolling() {
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            
            self.number = 77
        }
                
        expect(self.number).toSomeday.equal(77)
    }
    
//    func testExpectPollingFailure() {
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            self.number = 77
//        }
//
//        expect(self.number).toSomeday.equal(99)
//    }
    
    func testInvertedExpectPolling() {
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            
            self.number = 77
        }
                
        expect(self.number).toNever.equal(55)
    }
    
//    func testInvertedExpectPollingFailure() {
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            self.number = 77
//        }
//
//        expect(self.number).toNever.equal(77)
//    }
}
