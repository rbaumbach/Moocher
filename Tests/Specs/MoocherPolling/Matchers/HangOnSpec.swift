import XCTest
@testable import Moocher
@testable import MoocherPolling

final class HangOnSpec: XCTestCase {
    var number: Int?
    
    func testHangOnUntil() {
        hangOn(for: .seconds(10)) { complete in
            DispatchQueue.global(qos: .background).async { [weak self] in
                sleep(3)
                
                self?.number = 99
                
                DispatchQueue.main.async {
                    expect(self?.number).to.equal(99)
                    
                    complete()
                }
            }
        }
    }
    
    func testwhatever() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            sleep(3)
            
            self?.number = 99
            
            DispatchQueue.main.async {
                expect(self?.number).to.equal(99)
            }
        }
        
        // now I want to block for an extended amount of time (or until the assertion is true)
        
        // expect(number).to.someday.equal()
    }
    
//    func testHangOnFailure() {
//        hangOn(for: .seconds(3)) { complete in
//            DispatchQueue.global(qos: .background).async { [weak self] in
//                sleep(5)
//
//                self?.number = 99
//
//                DispatchQueue.main.async {
//                    expect(self?.number).to.equal(99)
//
//                    complete()
//                }
//            }
//        }
//    }
}
