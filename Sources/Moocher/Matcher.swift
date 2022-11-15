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

public struct Matcher<T> {
    // MARK: - Read only properties
    
    let expectedValue: ExpectedValue<T>?
    let to: Bool
    
    // MARK: - Public methods
    
    public func beNil(file: StaticString = #filePath,
                      line: UInt = #line) {
        BeNil().beNil(expectedValue?.value,
                      to: to,
                      file: file,
                      line: line)
    }
    
    public func beInstanceOf(_ actualValue: AnyObject,
                             file: StaticString = #filePath,
                             line: UInt = #line) {
        guard let expectedObject = expectedValue?.value as? AnyObject else {
            XCTFail("Expected value is not an object",
                    file: file,
                    line: line)
            
            return
        }
        
        guard !(expectedObject is NSNull) else {
            XCTFail("Expected value is nil (NSNull actually...)",
                    file: file,
                    line: line)
            
            return
        }
        
        BeInstanceOf().beInstanceOf(expectedObject,
                                    actualValue,
                                    to: to,
                                    file: file,
                                    line: line)
    }
    
    public func beKindOf<U>(_ type: U.Type,
                            file: StaticString = #filePath,
                            line: UInt = #line) {
        guard let expectedValue = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        BeKindOf().beKindOf(expectedValue,
                            type,
                            to: to,
                            file: file,
                            line: line)
    }
    
    public func conformTo<U>(_ conformingProtocol: U.Type,
                             file: StaticString = #filePath,
                             line: UInt = #line) {
        guard let expectedValue = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        ConformTo().conformTo(expectedValue,
                              conformingProtocol,
                              to: to,
                              file: file,
                              line: line)
    }
    
    public func equal(_ actualValue: T,
                      file: StaticString = #filePath,
                      line: UInt = #line) where T: Equatable {
        Equal().equal(expectedValue?.value,
                      actualValue,
                      to: to,
                      file: file,
                      line: line)
    }
    
    public func equal(_ actualValue: T,
                      within accuracy: T,
                      file: StaticString = #filePath,
                      line: UInt = #line) where T: FloatingPoint {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        Equal().equal(value,
                      actualValue,
                      to: to,
                      within: accuracy,
                      file: file,
                      line: line)
    }
    
    public func beTruthy(file: StaticString = #filePath,
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
        
        BeTruthy().beTruthy(booleanValue,
                          to: to,
                          file: file,
                          line: line)
    }
    
    public func beFalsy(file: StaticString = #filePath,
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
        
        BeFalsy().beFalsy(booleanValue,
                        to: to,
                        file: file,
                        line: line)
    }
    
    public func beLessThan(_ actualValue: T,
                           file: StaticString = #filePath,
                           line: UInt = #line) where T: Comparable {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        BeLessThan().beLessThan(value,
                                actualValue,
                                to: to,
                                file: file,
                                line: line)
    }
    
    public func beLessThanOrEqualTo(_ actualValue: T,
                                    file: StaticString = #filePath,
                                    line: UInt = #line) where T: Comparable {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        BeLessThanOrEqualTo().beLessThanOrEqualTo(value,
                                                  actualValue,
                                                  to: to,
                                                  file: file,
                                                  line: line)
    }
    
    public func beGreaterThan(_ actualValue: T,
                              file: StaticString = #filePath,
                              line: UInt = #line) where T: Comparable {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        BeGreaterThan().beGreaterThan(value,
                                      actualValue,
                                      to: to,
                                      file: file,
                                      line: line)
    }
    
    public func beGreaterThanOrEqualTo(_ actualValue: T,
                                       file: StaticString = #filePath,
                                       line: UInt = #line) where T: Comparable {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        BeGreaterThanOrEqualTo().beGreaterThanOrEqualTo(value,
                                                        actualValue,
                                                        to: to,
                                                        file: file,
                                                        line: line)
    }
    
    public func throwError(file: StaticString = #filePath,
                           line: UInt = #line,
                           errorHandler: ((Error) -> Void)? = nil) {
        guard let value = expectedValue?.value else {
            XCTFail("expected value block is nil",
                    file: file,
                    line: line)
            
            return
        }
                
        guard let throwExceptionBlock = value as? ThrowExceptionBlock else {
            XCTFail("expected value does not match throw exception block contract: () throws -> Void",
                    file: file,
                    line: line)

            return
        }
        
        ThrowError().throwError(throwExceptionBlock,
                                to: to,
                                file: file,
                                line: line,
                                errorHandler: errorHandler)
    }
    
    public func throwError(specificError: Error,
                           file: StaticString = #filePath,
                           line: UInt = #line) {
        guard let value = expectedValue?.value else {
            XCTFail("expected value block is nil",
                    file: file,
                    line: line)
            
            return
        }
                
        guard let throwExceptionBlock = value as? ThrowExceptionBlock else {
            XCTFail("expected value does not match throw exception block contract: () throws -> Void",
                    file: file,
                    line: line)

            return
        }
        
        ThrowError().throwError(throwExceptionBlock,
                                specificError: specificError,
                                to: to,
                                file: file,
                                line: line)
    }
    
    public func throwError<U>(errorType: U.Type,
                              file: StaticString = #filePath,
                              line: UInt = #line) where U: Error {
        guard let value = expectedValue?.value else {
            XCTFail("expected value block is nil",
                    file: file,
                    line: line)
            
            return
        }
                
        guard let throwExceptionBlock = value as? ThrowExceptionBlock else {
            XCTFail("expected value does not match throw exception block contract: () throws -> Void",
                    file: file,
                    line: line)

            return
        }
        
        ThrowError().throwError(throwExceptionBlock,
                                errorType: errorType,
                                to: to,
                                file: file,
                                line: line)
    }
    
    public func beEmpty(file: StaticString = #filePath,
                        line: UInt = #line) where T: Collection {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        BeEmpty().beEmpty(value,
                          to: to,
                          file:file,
                          line: line)
    }
    
    public func beEmpty(file: StaticString = #filePath,
                        line: UInt = #line) where T == String {
        guard let value = expectedValue?.value else {
            XCTFail("expected value is nil",
                    file: file,
                    line: line)
            
            return
        }
        
        BeEmpty().beEmpty(value,
                          to: to,
                          file: file,
                          line: line)
    }
}
