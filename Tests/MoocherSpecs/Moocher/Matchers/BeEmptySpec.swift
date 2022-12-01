import XCTest
@testable import Moocher

final class BeEmptySpec: XCTestCase {
    var emptyArray: [Int]!
    var emptyString: String!
    var optionalArray: [String]?
    
    override func setUp() {
        super.setUp()
        
        emptyArray = []
        emptyString = ""
    }
    
    func testToBeEmptyWithCollection() {
        expect(emptyArray).to.beEmpty()
        
        optionalArray = ["String"]
                
        expectFailure("non empty array should not be empty") {
            expect([1, 2, 3]).to.beEmpty()
        }
    }
    
    func testToNotBeEmptyWithCollection() {
        expect([1, 2, 3]).toNot.beEmpty()
        
        expectFailure("emptyArray should not be empty") {
            expect(emptyArray).toNot.beEmpty()
        }
    }
    
    func testToBeEmptyWithString() {
        expect(emptyString).to.beEmpty()
        
        expectFailure("non empty string should not be empty") {
            expect("DeLorean").to.beEmpty()
        }
    }
    
    func testToNotBeEmptyWithString() {
        expect("flux capacitor").toNot.beEmpty()
        
        expectFailure("emptyString should not be empty") {
            expect(emptyString).toNot.beEmpty()
        }
    }
}
    
