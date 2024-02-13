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

// Note: This functionality is a copy of the @Atomic property wrapper that can be found in my Capsule repo:
// https://github.com/rbaumbach/Capsule/blob/1.6.1/Sources/Capsule/Property%20Wrappers/Atomic.swift
// Since it's less than 50 lines long, I'm copying it to keep the dependency out of this project to
// simplify things.

@propertyWrapper
public struct Atomic<T> {
    // MARK: - Private properties
    
    private var value: T
    private let lock: NSLocking = NSLock()
    
    // MARK: - Init methods
    
    public init(wrappedValue value: T) {
        self.value = value
    }
    
    // MARK: - Public properties
    
    public var wrappedValue: T {
        get {
            atomicGet()
        }
        
        set {
            atomicSet(newValue)
        }
    }
    
    // MARK: - Private properties
    
    private func atomicGet() -> T {
        defer {
            lock.unlock()
        }
        
        lock.lock()

        return value
    }
    
    private mutating func atomicSet(_ value: T) {
        defer {
            lock.unlock()
        }
        
        lock.lock()
        
        self.value = value
    }
}
