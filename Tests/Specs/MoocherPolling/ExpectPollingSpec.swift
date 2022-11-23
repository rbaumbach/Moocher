import XCTest
@testable import Moocher
@testable import MoocherPolling

final class ExpectPollingSpec: XCTestCase {
    var number: Int?
    
    func testExpectPolling() {
        DispatchQueue.global(qos: .background).async {
            sleep(2)
            
            self.number = 77
        }
        
        expectPolling(self.number, 77)
    }
    
//    func testExpectPollingFailure() {
//        DispatchQueue.global(qos: .background).async {
//            sleep(2)
//            
//            self.number = 77
//        }
//        
//        expectPolling(self.number, 99)
//    }
}
