import XCTest
@testable import MoocherPolling

final class PollingContainSpec: XCTestCase {
    let longRunningTaskSimulator = LongRunningTaskSimulator()
    
    var turtleArray: [String]!
    var optionalArray: [String]?
    var tacos: [String]!
    var dogArray: [String]!
    
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
        tacos = ["Carne", "Pollo"]
        
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.tacos = ["Carnitas"]
        }
        
        expect(self.tacos).toSomeday.contain("Carnitas")
    }
    
    // TBD: Create a mechanism to test when something eventually fails
    
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
        dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
        
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.dogArray.append("German Shepard")
        }
        
        expect(self.dogArray).toNever.contain("Bloodhound")
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
