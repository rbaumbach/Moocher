import XCTest
@testable import Moocher

final class BeEmptySpec: XCTestCase {
    var emptyArray: [Int]!
    var optionalArray: [String]?
    var nilArray: [String]?
    
    var emptyString: String!
    var optionalEmptyString: String?
    var nilString: String?
    
    override func setUp() {
        super.setUp()
        
        emptyArray = []
        optionalArray = []
        
        emptyString = ""
        optionalEmptyString = ""
    }
    
    func testToBeEmptyWithCollection() {
        expect(emptyArray).to.beEmpty()
                
        expectFailure("non empty array should not be empty") {
            expect([1, 2, 3]).to.beEmpty()
        }
    }
    
    func testToBeEmptyWithCollectionWithOptional() {
        expect(optionalArray).to.beEmpty()
        
        expectFailure("optional array is not empty") {
            optionalArray?.append("Randy BoBandy")
            
            expect(optionalArray).to.beEmpty()
        }
    }
    
    func testToBeEmptyWithCollectionWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).to.beEmpty()
        }
    }
    
    func testToNotBeEmptyWithCollection() {
        expect([1, 2, 3]).toNot.beEmpty()
        
        expectFailure("emptyArray should not be empty") {
            expect(emptyArray).toNot.beEmpty()
        }
    }
    
    func testToNotBeEmptyWithCollectionWithOptional() {
        optionalArray?.append("James Lahey")
        
        expect(optionalArray).toNot.beEmpty()
        
        expectFailure("empty array is empty") {
            expect(emptyArray).toNot.beEmpty()
        }
    }
    
    func testToNotBeEmptyWithCollectionWithOptionalNil() {
        expectFailure("array is nil") {
            expect(nilArray).toNot.beEmpty()
        }
    }
    
    func testToBeEmptyWithString() {
        expect(emptyString).to.beEmpty()
        
        expectFailure("non empty string should not be empty") {
            expect("DeLorean").to.beEmpty()
        }
    }
    
    func testToBeEmptyWithStringWithOptional() {
        expect(optionalEmptyString).to.beEmpty()
        
        expectFailure("non empty string should not be empty") {
            let name = "Ritchie Valens"
            
            expect(name).to.beEmpty()
        }
    }
    
    func testToBeEmptyWithStringWithOptionalNil() {
        expectFailure("string is nil") {
            expect(nilString).to.beEmpty()
        }
    }
    
    func testToNotBeEmptyWithString() {
        expect("flux capacitor").toNot.beEmpty()
        
        expectFailure("emptyString should not be empty") {
            expect(emptyString).toNot.beEmpty()
        }
    }
        
    func testToNotBeEmptyWithStringWithOptional() {
        let name: String? = "Ritchie Valens"
        
        expect(name).toNot.beEmpty()
        
        expectFailure("empty string is empty") {
            expect(optionalEmptyString).toNot.beEmpty()
        }
    }
    
    func testToNotBeEmptyWithStringWithOptionalNil() {
        expectFailure("string is nil") {
            expect(nilString).toNot.beEmpty()
        }
    }
}
    
