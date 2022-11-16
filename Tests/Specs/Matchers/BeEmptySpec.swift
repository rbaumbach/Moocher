import XCTest
@testable import Moocher

final class BeEmptySpec: XCTestCase {
    var emptyArray: [Int]!
    
    override func setUp() {
        super.setUp()
        
        emptyArray = []
    }
    
    func testToBeEmpty() {
        expect(emptyArray).to.beEmpty()
        
        XCTExpectFailure("non empty array should not be empty") {
            expect([1, 2, 3]).to.beEmpty()
        }
    }
    
    func testToNotBeEmpty() {
        expect([1, 2, 3]).toNot.beEmpty()
        
        XCTExpectFailure("emptyArray should not be empty") {
            expect(emptyArray).toNot.beEmpty()
        }
    }
}
    
