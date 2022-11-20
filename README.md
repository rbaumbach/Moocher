# Moocher  [![Bitrise](https://app.bitrise.io/app/866964e6cf078a66/status.svg?token=NFbSqssymgeikicyWyBAcg&branch=maestro)](https://app.bitrise.io/app/866964e6cf078a66) [![Cocoapod Version](https://img.shields.io/cocoapods/v/Moocher.svg)](https://github.com/rbaumbach/Moocher) [![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager/) [![Cocoapod Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://github.com/rbaumbach/Moocher) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/Moocher/blob/master/MIT-LICENSE.txt)

A set of "rspec-like" test matchers that "mooch" off of `XCTest`.

## Adding Moocher to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add `Moocher` to your project.

1.  Add Moocher to your Podfile `pod 'Moocher'`.
2.  Install the pod(s) by running `pod install`.
3.  Add `Moocher` to your files with `import Moocher`.

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) can be used to add `Moocher` the to your project:

1.  Add `.package(url: "https://github.com/rbaumbach/Moocher", from: "0.0.1")`
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
expect({try functionThatThrowsAnError() })
    .to.throwError()
expect({try functionThatDoesNotThrowAnError() })
    .toNot.throwError()
```

* `throwError(block:errorHandler:)`

```swift
expect({try functionThatThrowsAnError() })
    .to.throwError { error in
        // Do something with error
    }
```

* `throwError(block:specificError:)`

```swift
expect({try functionThatThrowsABurritoError() })
    .to.throwError(specificError: BurritoError.beansMissing))
expect({try functionThatThrowsABurritoError() })
    .toNot.throwError(specificError: TacoError.salsaMissing))
```

* `throwError(block:errorType:)`

```swift
expect({try functionThatThrowsABurritoError() })
    .to.throwError(errorType: BurritoError.self))
expect({try functionThatThrowsABurritoError() })
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