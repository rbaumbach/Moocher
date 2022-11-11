# Moocher
A set of test matchers that "mooch" off of XCTest

## Expectations Using expect(...).to

```swift
import Moocher

expect(AnswerToUltimateQuestion.value).to.equal(42)
```

## Current matchers

* `beNil`
* `beInstance`
* `equal`
* `beTruthy`
* `beFalsy`