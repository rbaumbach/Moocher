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

public enum Time {
    case seconds(Int)
    case miliseconds(Int)
    case minutes(Int)
    
    func toTimeInterval() -> TimeInterval {
        switch self {
        case .seconds(let value):
            return TimeInterval(value)
        case .miliseconds(let value):
            return TimeInterval(value / 1000)
        case .minutes(let value):
            return TimeInterval(value / 60)
        }
    }
}

public func hangOn(for timeRepresentation: Time, work: (@escaping () -> Void) -> Void) {
    let testCase = XCTestCase()
    
    let expectation = testCase.expectation(description: "complete")
    
    let complete = {
        expectation.fulfill()
    }
    
    work(complete)
    
    testCase.waitForExpectations(timeout: timeRepresentation.toTimeInterval())
}