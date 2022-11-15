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

struct ThrowError {
    func throwError(_ block: () throws -> Void,
                    to: Bool,
                    file: StaticString = #filePath,
                    line: UInt = #line,
                    errorHandler: ((Error) -> Void)? = nil) {
        if to {
            let assertErrorHandler = errorHandler ?? { _ in }
            
            XCTAssertThrowsError(try block(),
                                 file: file,
                                 line: line,
                                 assertErrorHandler)
        } else {
            XCTAssertNoThrow(try block(),
                             file:file,
                             line:line)
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
                    XCTFail("expected value does not match throw error",
                            file: file,
                            line: line)

                    return
                }
            }
        } else {
            XCTAssertThrowsError(try block(),
                                 file: file,
                                 line: line) { error in
                if String(reflecting: specificError) == String(reflecting: error) {
                    XCTFail("expected value matches throw error",
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
            XCTAssertThrowsError(try block(),
                                 file: file,
                                 line: line) { error in
                if (error is T) {
                    XCTFail("\(errorType) is of type \(T.self)",
                            file: file,
                            line: line)

                    return
                }
            }
        }
    }
}
