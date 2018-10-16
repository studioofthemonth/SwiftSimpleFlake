# SwiftSimpleFlake
SimpleFlake distributed ID generation for Swift ❄️

Generate ids consisting of a 41 bit time followed 23 random bits. String outputs can be encoded to binary, base10 or hexadecimal.

The default epoch used to calculate dates is (00:00:00 UTC on 1 January 2001). This is based on Foundation's `timeIntervalSinceReferenceDate` but is fully customiazble during initialization.

Learn more about Simple Flake here: https://github.com/SawdustSoftware/simpleflake

## Requirements

- iOS 8.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.3+
- Swift 3.1+

## Installation

### Cocoapods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'SwiftSimpeFlake', :git => 'https://github.com/studioofthemonth/SwiftSimpleFlake.git'
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use Cocoapods, you can integrate SwiftSimpleFlake into your project manually.

## Usage

### Response Handling

Creating a SimpleFlake.

```swift
// Using default epoch
let flake = SimpleFlake()

// Using a custom epoch
let customFlake = SimpleFlake(date: Date(timeIntervalSince1970: 0))

// Using a seed for predictable result. Good for testing.
let seededFlake = SimpleFlake(seedInt: 4815162342)
```

Getting a SimpleFlake as a string.

```swift
let seededFlake = SimpleFlake(seedInt: 4815162342)

// Binary
seededFlake.toString(encoding: .binary) //100000101011011001101000010000111010000100000000000000000000000"

// Base 10
seededFlake.toString(encoding: .base10) //4709415155182600192

// Hexadecimal
seededFlake.toString(encoding: .hex)    //415b3421d0800000
```
