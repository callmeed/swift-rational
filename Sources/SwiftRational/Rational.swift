// The Swift Programming Language
// https://docs.swift.org/swift-book

struct Rational: CustomStringConvertible, Equatable {
    var numerator: Int
    var denominator: Int

    init(_ numerator: Int, _ denominator: Int) {
        precondition(denominator != 0, "Denominator cannot be zero.")
        let gcd = Rational.gcd(numerator, denominator)
        self.numerator = numerator / gcd
        self.denominator = denominator / gcd
        if self.denominator < 0 { // Normalize negative denominator
            self.numerator *= -1
            self.denominator *= -1
        }
    }
    
    // Secondary initializer to handle strings like "3/4"
    init(_ fraction: String) {
        let components = fraction.split(separator: "/").map { Int($0) }
        precondition(components.count == 2, "Invalid fraction format. Use 'numerator/denominator'.")
        guard let num = components[0], let den = components[1] else {
            fatalError("Invalid fraction format. Both numerator and denominator must be integers.")
        }
        self.init(num, den)
    }

    // Matches supported Unicode fractions
    var description: String {
        let key = "\(numerator)/\(denominator)"
        if let unicodeFraction = Rational.unicodeFractionMap()[key] {
            return unicodeFraction
        } else {
            return "\(numerator)/\(denominator)"
        }
    }

    // Arithmetic operations
    static func + (lhs: Rational, rhs: Rational) -> Rational {
        let num = lhs.numerator * rhs.denominator + rhs.numerator * lhs.denominator
        let den = lhs.denominator * rhs.denominator
        return Rational(num, den)
    }

    static func - (lhs: Rational, rhs: Rational) -> Rational {
        let num = lhs.numerator * rhs.denominator - rhs.numerator * lhs.denominator
        let den = lhs.denominator * rhs.denominator
        return Rational(num, den)
    }

    static func * (lhs: Rational, rhs: Rational) -> Rational {
        return Rational(lhs.numerator * rhs.numerator, lhs.denominator * rhs.denominator)
    }

    static func / (lhs: Rational, rhs: Rational) -> Rational {
        return Rational(lhs.numerator * rhs.denominator, lhs.denominator * rhs.numerator)
    }

    // MARK: Static functions
    
    // Greatest Common Divisor (GCD)
    private static func gcd(_ a: Int, _ b: Int) -> Int {
        var a = abs(a), b = abs(b)
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    // Map of fractions supported by unicode
    private static func unicodeFractionMap() -> [String: String] {
        let unicodeFractions: [String: String] = [
            "1/2": "½",
            "1/3": "⅓",
            "2/3": "⅔",
            "1/4": "¼",
            "3/4": "¾",
            "1/5": "⅕",
            "2/5": "⅖",
            "3/5": "⅗",
            "4/5": "⅘",
            "1/6": "⅙",
            "5/6": "⅚",
            "1/7": "⅐",
            "1/8": "⅛",
            "3/8": "⅜",
            "5/8": "⅝",
            "7/8": "⅞",
            "1/9": "⅑",
            "1/10": "⅒"
        ]
        return unicodeFractions
    }
}
