//MIT License
//
//Copyright (c) 2022 Ryan Baumbach <github@ryan.codes>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.

import XCTest

struct Matcher<T: Equatable> {
    let expectedValue: ExpectedValue<T>?
    let to: Bool
    
    func beNil(file: StaticString = #filePath,
               line: UInt = #line) {
        if to {
            XCTAssertNil(expectedValue?.value,
                         file: file,
                         line: line)
        } else {
            XCTAssertNotNil(expectedValue?.value,
                            file: file,
                            line: line)
        }
    }
    
    func beInstance(_ actualValue: AnyObject,
                    file: StaticString = #filePath,
                    line: UInt = #line) {
        guard let expectedObject = expectedValue?.value as? AnyObject else {
            XCTFail("Expected value is not an object",
                    file: file,
                    line: line)
            
            return
        }
        
        if to {
            XCTAssertIdentical(expectedObject,
                               actualValue,
                               file: file,
                               line: line)
        } else {
            XCTAssertNotIdentical(expectedObject,
                                  actualValue,
                                  file:file,
                                  line: line)
        }
    }
    
    func equal(_ actualValue: T,
               file: StaticString = #filePath,
               line: UInt = #line) {
        if to {
            XCTAssertEqual(expectedValue?.value,
                           actualValue,
                           file: file,
                           line: line)
        } else {
            XCTAssertNotEqual(expectedValue?.value,
                              actualValue,
                              file: file,
                              line: line)
        }
    }
    
    func beTruthy(file: StaticString = #filePath,
                  line: UInt = #line) {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        guard let booleanValue = value as? Bool else {
            XCTFail("expected value is not a boolean",
                    file: file,
                    line: line)
            
            return
        }
        
        if to {
            XCTAssertTrue(booleanValue,
                          file: file,
                          line: line)
        } else {
            XCTAssertFalse(booleanValue,
                           file: file,
                           line: line)
        }
    }
    
    func beFalsy(file: StaticString = #filePath,
                 line: UInt = #line) {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        guard let booleanValue = value as? Bool else {
            XCTFail("expected value is not a boolean",
                    file: file,
                    line: line)
            
            return
        }
        
        if to {
            XCTAssertFalse(booleanValue,
                           file: file,
                           line: line)
        } else {
            XCTAssertTrue(booleanValue,
                          file: file,
                          line: line)
        }
    }
}
