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

import Foundation

public struct PollingMatcherEngine<T> {
    // MARK: - Readonly properties
    
    let pollingActualValue: PollingActualValue<T>
    let isInverted: Bool
    
    // MARK: - Public methods
    
    public func beNil() {
        PollingBeNil().beNil(pollingActualValue.value,
                             timeout: pollingActualValue.timeout,
                             pollingInterval: pollingActualValue.pollingInterval,
                             isInverted: isInverted)
    }
    
    public func beTruthy() where T == Bool {
        PollingBeTruthy().beTruthy(pollingActualValue.value,
                                   timeout: pollingActualValue.timeout,
                                   pollingInterval: pollingActualValue.pollingInterval,
                                   isInverted: isInverted)
    }
    
    public func beFalsy() where T == Bool {
        PollingBeFalsy().beFalsy(pollingActualValue.value,
                                 timeout: pollingActualValue.timeout,
                                 pollingInterval: pollingActualValue.pollingInterval,
                                 isInverted: isInverted)
    }
    
    public func equal(_ expectedValue: T) where T: Equatable {
        PollingEqual().equal(pollingActualValue.value,
                             expectedValue,
                             timeout: pollingActualValue.timeout,
                             pollingInterval: pollingActualValue.pollingInterval,
                             isInverted: isInverted)
    }
    
    public func contain<U>(_ item: U) where T: Collection, T.Element: Equatable, T.Element == U {
        PollingContain().contain(pollingActualValue.value,
                                 item,
                                 timeout: pollingActualValue.timeout,
                                 pollingInterval: pollingActualValue.pollingInterval,
                                 isInverted: isInverted)
    }
}
