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

struct StartWith {
    func startWith<T, U>(_ value: T,
                         _ item: U,
                         to: Bool,
                         file: StaticString = #filePath,
                         line: UInt = #line) where T: Collection, T.Element: Equatable, T.Element == U {
        guard let firstItem = value.first else {
            XCTFail("\(value) is empty",
                    file: file,
                    line: line)
            
            return
        }
                
        if to {
            if firstItem != item {
                XCTFail("\(value) does not start with \(item)",
                        file: file,
                        line: line)
                
                return
            }
        } else {
            if firstItem == item {
                XCTFail("\(value) starts with \(item)",
                        file: file,
                        line: line)
                
                return
            }
        }
    }
}
