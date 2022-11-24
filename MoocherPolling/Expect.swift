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

import Foundation

public struct ExpectDefaults {
    public static let timeout: Time = .seconds(5)
    public static let pollingInterval: Time = .miliseconds(100)
}

public func expect<T>(_ block: @autoclosure @escaping () -> T,
                      timeout: Time = ExpectDefaults.timeout,
                      pollingInterval: Time = ExpectDefaults.pollingInterval) -> PollingActualValue<T> {
    return PollingActualValue(value: block,
                              timingInfo: (timeout, pollingInterval))
}

public func expect<T>(_ block: @autoclosure @escaping () -> T?,
                      timeout: Time = ExpectDefaults.timeout,
                      pollingInterval: Time = ExpectDefaults.pollingInterval) -> OptionalPollingActualValue<T> {
    return OptionalPollingActualValue(value: block,
                                      timingInfo: (timeout, pollingInterval))
}
