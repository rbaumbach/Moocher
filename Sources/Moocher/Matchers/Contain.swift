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

struct Contain {
    // MARK: - Public methods
    
    func contain<T, U>(_ value: T,
                       _ item: U,
                       to: Bool,
                       file: StaticString = #filePath,
                       line: UInt = #line) where T: Collection, T.Element: Equatable, T.Element == U {
        let hasElement = value.contains(item)
        
        if to {
            if !hasElement {
                XCTFail("\(value) does not contain \(item)",
                        file: file,
                        line: line)
            }
        } else {
            if hasElement {
                XCTFail("\(value) contains \(item)",
                        file: file,
                        line: line)
            }
        }
    }
    
    func contain(_ value: String,
                 _ substring: String,
                 to: Bool,
                 file: StaticString = #filePath,
                 line: UInt = #line) {
        let hasSubstring = value.contains(substring)

        if to {
            if !hasSubstring {
                XCTFail("\(value) does not contain \(substring)",
                        file: file,
                        line: line)
            }
        } else {
            if hasSubstring {
                XCTFail("\(value) contains \(substring)",
                        file: file,
                        line: line)
            }
        }
    }
}
