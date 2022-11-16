import XCTest
@testable import Moocher

final class Specs: XCTestCase {
    var somethingNil: Int?
    var somethingNonNil: Int!
    
    override func setUp() {
        super.setUp()
        
        somethingNonNil = 99
    }
    

}
