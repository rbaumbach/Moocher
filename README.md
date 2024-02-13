# Moocher [![Cocoapod Version](https://img.shields.io/cocoapods/v/Moocher.svg)](https://github.com/rbaumbach/Moocher) [![Swift Version](https://img.shields.io/badge/Swift-5.5-blue)](https://github.com/rbaumbach/Utensils/blob/master/Package.swift) [![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager/) [![Cocoapod Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://github.com/rbaumbach/Moocher) ![iOS Deployment Target](https://img.shields.io/badge/iOS_Deployment_Target-11.0-964B00) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/Moocher/blob/master/MIT-LICENSE.txt)

A set of "rspec-like" test matchers that "mooch" off of `XCTest`.

## Adding Moocher to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add `Moocher` to your project.

1.  Add `Moocher` to your Podfile `pod 'Moocher'`.
2.  Install the pod(s) by running `pod install`.
3.  Add `Moocher` to your files with `import Moocher`.

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) can be used to add `Moocher` the to your project:

1.  Add `.package(url: "https://github.com/rbaumbach/Moocher", from: "0.4.2")`
2.  [Follow intructions to add](https://swift.org/getting-started/#using-the-package-manager) the `Moocher` package to your project.

Note: Since `Moocher` requires the library `XCTest`, when you add `Moocher` to your project, be sure that it's added to your unit testing target.

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from `Sources/Moocher` directory to your project.

## Usage

Moocher matchers are inspired by [RSpec](https://rspec.info):

```swift
expect(AnswerToUltimateQuestion.value).to.equal(42)
```

### Equivalence and Identity

* `equal`

This matcher works for types that conform to `Equatable`, but also works for types that conform to `FloatingPoint` as well.

```swift
expect(99).to.equal(99)
expect(99).toNot.equal(100)

expect(9.9).to.equal(9.9, within: 0.1)
expect(9.9).toNot.equal(10.9, within: 0.1)
```

### Types

* `beInstanceOf`

```swift
class Dog { }

let chihuahua = Dog()
let pancho = chihuahua
let miniPinscher = Dog()

expect(chihuahua).to.beInstanceOf(pancho)
expect(chihuahua).toNot.beInstanceOf(miniPinscher)
```

* `beKindOf`

```swift
class Dog { }
struct Fish { }

let dog = Dog()

expect(dog).to.beKindOf(Dog.self)
expect(dog).toNot.beKindOf(Fish.self)
```

* `conformTo`

```swift
protocol Wolf { }
class Dog: Wolf { }

protocol Goat { }

let dog = Dog()

expect(dog).to.conformTo(Wolf.self)
expect(dog).toNot.conformTo(Goat.self)
```

### Comparisons

* `beLessThan`

```swift
expect(9).to.beLessThan(10)
expect(9).toNot.beLessThan(8)
```

* `beLessThanOrEqualTo`

```swift
expect(9).to.beLessThanOrEqualTo(9)
expect(11).toNot.beLessThanOrEqualTo(10)
```

* `beGreaterThan`

```swift
expect(9).to.beGreaterThan(8)
expect(7).toNot.beGreaterThan(8)
```

* `beGreaterThanOrEqualTo`

```swift
expect(9).to.beGreaterThanOrEqualTo(8)
expect(7).toNot.beGreaterThanOrEqualTo(8)
```

### Truthiness

* `beTruthy`

```swift
expect(true).to.beTruthy()
expect(false).toNot.beTruthy()
```

* `beFalsy`

```swift
expect(false).to.beFalsy()
expect(true).toNot.beFalsy()
```

* `beNil`

```swift
var number: Int?

expect(number).to.beNil()

number = 99

expect(number).toNot.beNil()
```

### Error Throwing

* `throwError`

The `throwError` matcher can be used in 4 different ways:

* `throwError(block:)`

```swift
expect({ try functionThatThrowsAnError() })
    .to.throwError()
expect({ try functionThatDoesNotThrowAnError() })
    .toNot.throwError()
```

* `throwError(block:errorHandler:)`

```swift
expect({ try functionThatThrowsAnError() })
    .to.throwError { error in
        // Do something with error
    }
```

* `throwError(block:specificError:)`

```swift
expect({ try functionThatThrowsABurritoError() })
    .to.throwError(specificError: BurritoError.beansMissing))
expect({ try functionThatThrowsABurritoError() })
    .toNot.throwError(specificError: TacoError.salsaMissing))
```

* `throwError(block:errorType:)`

```swift
expect({ try functionThatThrowsABurritoError() })
    .to.throwError(errorType: BurritoError.self))
expect({ try functionThatThrowsABurritoError() })
    .toNot.throwError(errorType: TacoError.self))
```

### Collection

* `beEmpty`

This matcher works for types that conform to `Collection`.

```swift
let emptyArray: [Int] = []

expect(emptyArray).to.beEmpty()
expect([1, 2, 3]).toNot.beEmpty()
```

This matcher also works for `String`s as well.

```swift
expect("").to.beEmpty()
expect("Taco").toNot.beEmpty()
```

* `startWith`

```swift
expect(["a", "b", "c"]).to.startWith("a")
expect([2, 4, 8]).toNot.startWith(1)
```

* `endWith`

```swift
expect(["a", "b", "c"]).to.endWith("c")
expect([2, 4, 8]).toNot.endWith(7)
```

* `haveSizeOf`

```swift
expect(["taco", "burrito"]).to.haveSizeOf(2)
expect([2, 4, 8]).toNot.haveSizeOf(7)
```

### Sequence

* `contain`

This matcher works for types that conform to `Sequence`.

```swift
expect(["uno", "dos", "tres"]).to.contain("tres")
expect("Billy Goat").toNot.contain("$")
```

This matcher also works for finding a substring within a `String`.

```swift
expect("Corey and Trevor").to.contain("and")
expect("Richard LaFleur").toNot.contain("Smart")
```

### Compound matchers

Some of the matchers allow for compounding assertions:

```swift
expect([1, 2, 3]).to.contain(1).and.startWith(1).and.endWith(3)
expect([1, 2, 3]]).toNot.haveSizeOf(4).and.contain(7)
```

The following matchers can be used compoundly:

* `startWith`
* `endWith`
* `contain`
* `haveSizeOf`
* `haveMinValueOf`
* `haveMaxValueOf`

## Moocher Polling

This repo also contains an additional library for polling values when writing integration tests that have to "wait" for assertions.

This can be added to your project:

### CocoaPods

1.  Add `MoocherPolling` to your Podfile `pod 'Moocher/Polling'`.
2.  Install the pod(s) by running `pod install`.
3.  Add `MoocherPolling` to your files with `import MoocherPolling`.

### Swift Package Manager

1. Add `MoocherPolling` to your target: `Build Phases` -> `Link Binary With Libraries`.
2. Add `MoocherPolling` to your files with `import MoocherPolling`.

### HangOn

`HangOn` is a function that allows block input that will wait for an assertion given a specific timeframe.

```swift
hangOn(for: .seconds(10)) { complete in
    var number = 100
    
    DispatchQueue.global(qos: .background).async { [weak self] in
        sleep(3)
        
        number = 99
        
        DispatchQueue.main.async {
            expect(number).to.equal(99)
            
            complete()
        }
    }
}
```

### toSomeday and toNever

Values can be constantly polled using familiar `expect` syntax using `toSomeday` and `toNever`.

```swift
var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]

DispatchQueue.global(qos: .background).async {
    sleep(3)

    dogArray.append("German Shepard")
}

expect(dogArray).toSomeday.contain("German Shepard")
```

```swift
var dogArray = ["Chihuhahua", "Miniature Pinscher", "Border Collie"]

DispatchQueue.global(qos: .background).async {
    sleep(3)

    dogArray.append("German Shepard")
}

expect(dogArray).toNever.contain("Poodle")
```

The `expect` clause will block tests from running until either a timeout has been hit, or the assertion you expect is true.  The default timeout is `5` seconds.  This can be set by providing a `timeout` value.

The interval in which the polling is done on the value being asserted has a default interval of `100` milliseconds.  This can be set by providing a `pollingInterval` value.

```swift
expect(dogArray, timeout: .seconds(10), pollingInterval: .miliseconds(500)).toSomeday.contain("German Shepard")
```

The following matchers can be used for `toSomeday` and `toNever`:

* `beNil`
* `equal`
* `contain`
