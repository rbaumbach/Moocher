# Moocher  [![Bitrise](https://app.bitrise.io/app/866964e6cf078a66/status.svg?token=NFbSqssymgeikicyWyBAcg&branch=maestro)](https://app.bitrise.io/app/866964e6cf078a66) [![Cocoapod Version](https://img.shields.io/cocoapods/v/Moocher.svg)](https://github.com/rbaumbach/Moocher) [![SPM Compatible](https://img.shields.io/badge/SPM-Compatible-blue)](https://swift.org/package-manager/) [![Cocoapod Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://github.com/rbaumbach/Moocher) [![License](https://img.shields.io/dub/l/vibe-d.svg)](https://github.com/rbaumbach/Moocher/blob/master/MIT-LICENSE.txt)

A set of "rspec-like" test matchers that "mooch" off of XCTest

## Adding Moocher to your project

### CocoaPods

[CocoaPods](http://cocoapods.org) is the recommended way to add Utensils to your project.

1.  Add Moocher to your Podfile `pod 'Moocher'`.
2.  Install the pod(s) by running `pod install`.
3.  Add Utensils to your files with `import Moocher`.

### Swift Package manager

[Swift Package Manager](https://swift.org/package-manager/) can be used to add `Moocher` the to your project:

1.  Add `.package(url: "https://github.com/rbaumbach/Moocher", from: "0.0.1")`
2.  [Follow intructions to add](https://swift.org/getting-started/#using-the-package-manager) the `Moocher` package to your project.

### Clone from Github

1.  Clone repository from github and copy files directly, or add it as a git submodule.
2.  Add all files from `Source` directory to your project.

## Expectations Using expect(...).to

```swift
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