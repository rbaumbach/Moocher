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

public typealias ThrowExceptionBlock = () throws -> Void

public struct MatcherEngine<T> {
    // MARK: - Read only properties
    
    let actualValue: ActualValue<T>
    let to: Bool
    
    // MARK: - Public methods
    
    public func beInstanceOf(_ expectedObject: AnyObject,
                             file: StaticString = #filePath,
                             line: UInt = #line) where T: AnyObject {
        guard !(actualValue.value is NSNull) else {
            XCTFail("Expected value is nil (NSNull actually...)",
                    file: file,
                    line: line)
            
            return
        }
        
        BeInstanceOf().beInstanceOf(actualValue.value,
                                    expectedObject,
                                    to: to,
                                    file: file,
                                    line: line)
    }
    
    public func beKindOf<U>(_ type: U.Type,
                            file: StaticString = #filePath,
                            line: UInt = #line) {
        BeKindOf().beKindOf(actualValue.value,
                            type,
                            to: to,
                            file: file,
                            line: line)
    }
    
    public func conformTo<U>(_ conformingProtocol: U.Type,
                             file: StaticString = #filePath,
                             line: UInt = #line) {
        ConformTo().conformTo(actualValue.value,
                              conformingProtocol,
                              to: to,
                              file: file,
                              line: line)
    }
    
    public func equal(_ expectedValue: T,
                      file: StaticString = #filePath,
                      line: UInt = #line) where T: Equatable {
        Equal().equal(actualValue.value,
                      expectedValue,
                      to: to,
                      file: file,
                      line: line)
    }
    
    public func equal(_ expectedValue: T,
                      within accuracy: T,
                      file: StaticString = #filePath,
                      line: UInt = #line) where T: FloatingPoint {
        Equal().equal(actualValue.value,
                      expectedValue,
                      to: to,
                      within: accuracy,
                      file: file,
                      line: line)
    }
    
    public func beTruthy(file: StaticString = #filePath,
                         line: UInt = #line) where T == Bool {
        BeTruthy().beTruthy(actualValue.value,
                            to: to,
                            file: file,
                            line: line)
    }
    
    public func beFalsy(file: StaticString = #filePath,
                        line: UInt = #line) where T == Bool {
        BeFalsy().beFalsy(actualValue.value,
                          to: to,
                          file: file,
                          line: line)
    }
    
    public func beLessThan(_ expectedValue: T,
                           file: StaticString = #filePath,
                           line: UInt = #line) where T: Comparable {
        BeLessThan().beLessThan(actualValue.value,
                                expectedValue,
                                to: to,
                                file: file,
                                line: line)
    }
    
    public func beLessThanOrEqualTo(_ expectedValue: T,
                                    file: StaticString = #filePath,
                                    line: UInt = #line) where T: Comparable {
        BeLessThanOrEqualTo().beLessThanOrEqualTo(actualValue.value,
                                                  expectedValue,
                                                  to: to,
                                                  file: file,
                                                  line: line)
    }
    
    public func beGreaterThan(_ expectedValue: T,
                              file: StaticString = #filePath,
                              line: UInt = #line) where T: Comparable {
        BeGreaterThan().beGreaterThan(actualValue.value,
                                      expectedValue,
                                      to: to,
                                      file: file,
                                      line: line)
    }
    
    public func beGreaterThanOrEqualTo(_ expectedValue: T,
                                       file: StaticString = #filePath,
                                       line: UInt = #line) where T: Comparable {
        BeGreaterThanOrEqualTo().beGreaterThanOrEqualTo(actualValue.value,
                                                        expectedValue,
                                                        to: to,
                                                        file: file,
                                                        line: line)
    }
    
    public func throwError(file: StaticString = #filePath,
                           line: UInt = #line) {
        guard let actualThrowExceptionBlock = actualValue.value as? ThrowExceptionBlock else {
            XCTFail("expected value does not match throw exception block contract: () throws -> Void",
                    file: file,
                    line: line)
            
            return
        }
        
        ThrowError().throwError(actualThrowExceptionBlock,
                                to: to,
                                file: file,
                                line: line)
    }
    
    public func throwError(file: StaticString = #filePath,
                           line: UInt = #line,
                           errorHandler: (Error) -> Void) {
        guard let actualThrowExceptionBlock = actualValue.value as? ThrowExceptionBlock else {
            XCTFail("expected value does not match throw exception block contract: () throws -> Void",
                    file: file,
                    line: line)
            
            return
        }
        
        ThrowError().throwError(actualThrowExceptionBlock,
                                to: to,
                                file: file,
                                line: line,
                                errorHandler: errorHandler)
    }
    
    public func throwError(specificError: Error,
                           file: StaticString = #filePath,
                           line: UInt = #line) {
        guard let actualThrowExceptionBlock = actualValue.value as? ThrowExceptionBlock else {
            XCTFail("expected value does not match throw exception block contract: () throws -> Void",
                    file: file,
                    line: line)
            
            return
        }
        
        ThrowError().throwError(actualThrowExceptionBlock,
                                specificError: specificError,
                                to: to,
                                file: file,
                                line: line)
    }
    
    public func throwError<U>(errorType: U.Type,
                              file: StaticString = #filePath,
                              line: UInt = #line) where U: Error {
        guard let actualThrowExceptionBlock = actualValue.value as? ThrowExceptionBlock else {
            XCTFail("expected value does not match throw exception block contract: () throws -> Void",
                    file: file,
                    line: line)
            
            return
        }
        
        ThrowError().throwError(actualThrowExceptionBlock,
                                errorType: errorType,
                                to: to,
                                file: file,
                                line: line)
    }
    
    public func beEmpty(file: StaticString = #filePath,
                        line: UInt = #line) where T: Collection {
        BeEmpty().beEmpty(actualValue.value,
                          to: to,
                          file:file,
                          line: line)
    }
    
    public func beEmpty(file: StaticString = #filePath,
                        line: UInt = #line) where T == String {
        BeEmpty().beEmpty(actualValue.value,
                          to: to,
                          file: file,
                          line: line)
    }
}
