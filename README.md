# Moocher [![Cocoapod Version](https://img.shields.io/cocoapods/v/Moocher.svg)](https://github.com/rbaumbach/Moocher) [![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager/) [![Cocoapod Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://github.com/rbaumbach/Moocher) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/Moocher/blob/master/MIT-LICENSE.txt)
A set of test matchers that "mooch" off of XCTest

## Expectations Using expect(...).to

```swift
import Moocher

expect(AnswerToUltimateQuestion.value).to.equal(42)
```

## Current matchers

* `beNil`
* `beInstance`
* `beKindOf`
* `conformTo`
* `equal`
* `beTruthy`
* `beFalsy`
* `beLessThan`
* `beLessThanOrEqualTo`
* `beGreaterThan`
* `beGreaterThanOrEqualTo`
* `throwError`
* `beEmpty`