# Swift Rational: A Swift Struct for handling Rational Numbers (ie Fractions) with Unicode support

This project aims to port Ruby's Rational class or Python's fractions module in Swift.

## Usage

```
let r = Rational(3, 4)
print(r)
// Output: ¾

let sum = Rational(1, 3) + Rational(1, 6)
print(sum)
// Output: ½
```

## Extension

There is an included Int extension that allows you to create a Rational from an Int:

```
let r = 3.toRational()
```
