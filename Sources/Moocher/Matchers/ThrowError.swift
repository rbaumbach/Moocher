//  MIT License
//
//  Copyright (c) 2023-2024 Ryan Baumbach <github@ryan.codes>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import XCTest

struct ThrowError {
    func throwError(_ block: () throws -> Void,
                    to: Bool,
                    file: StaticString = #filePath,
                    line: UInt = #line) {
        if to {
            XCTAssertThrowsError(try block(),
                                 file: file,
                                 line: line)
        } else {
            XCTAssertNoThrow(try block(),
                             file: file,
                             line: line)
        }
    }
    
    func throwError<T>(_ block: () throws -> Void,
                       to: Bool,
                       file: StaticString = #filePath,
                       line: UInt = #line,
                       errorHandler: (T) -> Void) where T: Error {
        let xctAssertErrorHandler: (Error) -> Void = { error in
            if let error = error as? T {
                errorHandler(error)
            } else {
                XCTFail("Error being thrown is not the expected type",
                        file: file,
                        line: line)
            }
        }
        
        if to {
            XCTAssertThrowsError(try block(),
                                 file: file,
                                 line: line,
                                 xctAssertErrorHandler)
        } else {
            XCTFail("This matcher cannot be used when an exception is not expected to be thrown",
                    file: file,
                    line: line)
            
            return
        }
    }
    
    func throwError(_ block: () throws -> Void,
                    specificError: Error,
                    to: Bool,
                    file: StaticString = #filePath,
                    line: UInt = #line) {
        if to {
            XCTAssertThrowsError(try block(),
                                 file: file,
                                 line: line) { error in
                if String(reflecting: specificError) != String(reflecting: error) {
                    XCTFail("actual value does not match thrown error",
                            file: file,
                            line: line)

                    return
                }
            }
        } else {
            do {
                try block()
            } catch {
                if String(reflecting: error) == String(reflecting: specificError) {
                    XCTFail("actual value matches thrown error",
                            file: file,
                            line: line)
                    
                    return
                }
            }
        }
    }

    func throwError<T>(_ block: () throws -> Void,
                       errorType: T.Type,
                       to: Bool,
                       file: StaticString = #filePath,
                       line: UInt = #line) where T: Error {
        if to {
            XCTAssertThrowsError(try block(),
                                 file: file,
                                 line: line) { error in
                if !(error is T) {
                    XCTFail("\(errorType) is not of type \(T.self)",
                            file: file,
                            line: line)

                    return
                }
            }
        } else {
            do {
                try block()
            } catch {
                if error is T {
                    XCTFail("\(errorType) is of type \(T.self)",
                            file: file,
                            line: line)

                    return
                }
            }
        }
    }
}
