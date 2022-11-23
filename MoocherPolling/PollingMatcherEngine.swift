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

public struct PollingMatcherEngine<T> {
    // MARK: - Readonly properties
    
    let pollingActualValue: PollingActualValue<T>
    let isInverted: Bool
    
    // MARK: - Public methods
    
    public func equal(_ expectedValue: T) where T: Equatable {
        let pollingInterval = pollingActualValue.timingInfo.pollingInterval
        let timeout = pollingActualValue.timingInfo.timeout

        waitForExpectation(pollingInterval: pollingInterval,
                           timeout: timeout,
                           isInverted: isInverted) { complete in
            let updatedValue = pollingActualValue.value()
            
            if updatedValue == expectedValue {
                complete()

                return
            }
        }
    }
    
    // MARK: - Private methods
    
    private func waitForExpectation(pollingInterval: Time,
                                    timeout: Time,
                                    isInverted: Bool,
                                    matcherBlock: @escaping (@escaping () -> Void) -> Void) where T: Equatable {
        let testCase = XCTestCase()
        
        let expectation = testCase.expectation(description: "polling expectation")
        expectation.isInverted = isInverted

        Timer.scheduledTimer(withTimeInterval: pollingInterval.toTimeInterval(),
                             repeats: true) { timer in
            let complete = {
                expectation.fulfill()
                timer.invalidate()
                
                return
            }

            matcherBlock(complete)
        }

        testCase.waitForExpectations(timeout: timeout.toTimeInterval())
    }
}
