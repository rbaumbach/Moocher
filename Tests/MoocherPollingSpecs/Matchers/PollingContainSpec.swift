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
        
    func testToSomedayContainFailure() {
        dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]

        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.dogArray.append("German Shepard")
        }

        expectFailure(self.dogArray).toSomeday.contain("Bloodhound")
    }
    
    func testToNeverContain() {
        dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]
        
        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.dogArray.append("German Shepard")
        }
        
        expect(self.dogArray).toNever.contain("Bloodhound")
    }
    
    func testToNeverContainFailure() {
        dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]

        longRunningTaskSimulator.longRunningTask { [weak self] in
            self?.dogArray.append("German Shepard")
        }

        expectFailure(self.dogArray).toNever.contain("German Shepard")
    }
}
