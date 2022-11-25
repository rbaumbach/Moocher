import XCTest
@testable import Moocher
@testable import MoocherPolling

final class ExpectPollingSpec: XCTestCase {
    var number: Int?
    
    func testExpectToSomedayEqual() {
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            
            self.number = 77
        }
                
        expect(self.number).toSomeday.equal(77)
    }
    
//    func testExpectToSomedayEqualFailure() {
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            self.number = 77
//        }
//
//        expect(self.number).toSomeday.equal(99)
//    }
    
    func testExpectToNeverEqual() {
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            
            self.number = 77
        }
                
        expect(self.number).toNever.equal(55)
    }
    
//    func testExpectToNeverEqualFailure() {
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            self.number = 77
//        }
//
//        expect(self.number).toNever.equal(77)
//    }
    
    func testExpectToSomedayBeNil() {
        self.number = 100
        
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            
            self.number = nil
        }
                
        expect(self.number).toSomeday.beNil()
    }
    
//    func testExpectToSomedayBeNilFailure() {
//        self.number = 100
//
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            self.number = 200
//        }
//
//        expect(self.number).toSomeday.beNil()
//    }
    
    func testExpectToNeverBeNil() {
        self.number = 100

        DispatchQueue.global(qos: .background).async {
            sleep(1)

            self.number = 200
        }

        expect(self.number).toNever.beNil()
    }
    
//    func testExpectToNeverBeNilFailure() {
//        self.number = 100
//
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            self.number = nil
//        }
//
//        expect(self.number).toNever.beNil()
//    }
    
    func testExpectToSomedayContain() {
        var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
        
        DispatchQueue.global(qos: .background).async {
            sleep(1)

            dogArray.append("German Shepard")
        }
        
        expect(dogArray).toSomeday.contain("German Shepard")
    }
    
//    func testExpectToSomedayContainFailure() {
//        var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
//
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            dogArray.append("German Shepard")
//        }
//
//        expect(dogArray).toSomeday.contain("Bloodhound")
//    }
    
    func testExpectToNeverContain() {
        var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
        
        DispatchQueue.global(qos: .background).async {
            sleep(1)

            dogArray.append("German Shepard")
        }
        
        expect(dogArray).toNever.contain("Bloodhound")
        
        expect(dogArray, timeout: .seconds(10), pollingInterval: .miliseconds(500))
    }
    
//    func testExpectToNeverContainFailure() {
//        var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
//
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//
//            dogArray.append("German Shepard")
//        }
//
//        expect(dogArray).toNever.contain("German Shepard")
//    }
}
