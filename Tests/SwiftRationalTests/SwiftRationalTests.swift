import Testing
@testable import SwiftRational

@Test func example() async throws {
    // Basic initialization, simplification and unicode output
    let r1 = Rational(6, 8) // Should simplify to 3/4
    #expect(r1.numerator == 3)
    #expect(r1.denominator == 4)
    #expect(r1.description == "¾")
    
    // String initialization
    let r2 = Rational("1/2")
    #expect(r2.numerator == 1)
    #expect(r2.denominator == 2)
    #expect(r2.description == "½")
    
    // Non-unicode fractions
    let r3 = Rational(11, 13)
    #expect(r3.numerator == 11)
    #expect(r3.denominator == 13)
    #expect(r3.description == "11/13")
    
    // Integer extension
    let r4 = Rational(4, 1)
    let i4 = 4
    #expect(r4 == i4.toRational())
    
}
