#  NoExceptions

This is a library that provides the ability for Swift code to catch an `NSException`. 

This is useful since the standard `try` and `catch` mechanism provided by Swift will not capture an `NSException` thrown from Objective-C. 

### Syntax

Presuming an Objective-C method that can throw an instance of  `NSException` as shown in the example of  `MyClass` below, the second example would allow for catching the exception in a Swift `Error` type that wraps it.

```objC
@interface MyClass: NSObject

- (void)throwingMethod;
- (id)throwingGetter;

@end
```

```swift
try? trapping(trappable: myObject.throwingMethod)
try? trapping { myObject.throwingMethod() }
let foo = try? trapping { myObject.throwingGetter() }
try? trapping { let bar = myObject.throwingGetter() }
let baz = try? trapping(trappable: myObject.throwingGetter)

do {
    try trapping { myObject.throwingMethod() }
    let variable = try trapping { myObject.throwingGetter() }
    try trapping { let bar = myObject.throwingGetter() }
}
catch error as NSExceptionError {
    /// handle error containing exception
}
```
