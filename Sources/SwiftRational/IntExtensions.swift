//
//  IntExtensions.swift
//  SwiftRational
//
//  Created by Ed Dungan on 1/7/25.
//

extension Int {
    // Convert an Int to a Rational
    func toRational() -> Rational {
        return Rational(self, 1)
    }
}
