import XCTest
@testable import MoocherPolling

final class PollingContainSpec: XCTestCase {
    var turtleArray: [String]!
    var optionalArray: [String]?
    var longRunningTaskSimulator = LongRunningTaskSimulator()
    
    override func setUp() {
        super.setUp()
        
        turtleArray = ["Leo", "Donnie", "Rafe", "Mikey"]
    }
    
    func testToSomedayContain() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.turtleArray.append("Master Splinter")
        }
        
        expect(self.turtleArray).toSomeday.contain("Master Splinter")
    }
    
    func testToSomedayContainWithOptional() {
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.optionalArray = ["MC Hammer"]
        }
        
        expect(self.optionalArray).toSomeday.contain("MC Hammer")
    }
    
    func testToSomedayContainLocal() {
        var tacos = ["Carne", "Pollo"]
        
        longRunningTaskSimulator.longRunningTask {
            tacos = ["Carnitas"]
        }
        
        expect(tacos).toSomeday.contain("Carnitas")
    }
    
//    func testToSomedayContainFailure() {
//        var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
//
//        longRunningTaskSimulator.longRunningTask {
//            dogArray.append("German Shepard")
//        }
//
//        expect(dogArray).toSomeday.contain("Bloodhound")
//    }
    
    func testToNeverContain() {
        var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
        
        longRunningTaskSimulator.longRunningTask {
            dogArray.append("German Shepard")
        }
        
        expect(dogArray).toNever.contain("Bloodhound")
    }
    
//    func testToNeverContainFailure() {
//        var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
//
//        longRunningTaskSimulator.longRunningTask {
//            dogArray.append("German Shepard")
//        }
//
//        expect(dogArray).toNever.contain("German Shepard")
//    }
}
