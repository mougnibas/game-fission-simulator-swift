// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// A private implementation for a RandomNumberGenerator, to be used with unit tests.
public struct RandomNumberGeneratorWithSeed: RandomNumberGenerator {

    /// Initialize the class with this seed.
    ///
    /// - Parameters :
    ///     - seed: The seed to use.
    init(_ seed: Int) {
        srand48(seed)
    }

    public func next() -> UInt64 {

        // Partially based on thread :
        // https://stackoverflow.com/questions/54821659/swift-4-2-seeding-a-random-number-generator

        // This "legacy_random" code is mandatory to be able to use a custom seed for random number generation.
        // swiftlint:disable legacy_random
        let randomDouble: Double = drand48() * Double(UInt64.max)
        // swiftlint:enable legacy_random

        // wrap the double random to a UInt64
        let randomUInt64 = UInt64(randomDouble)

        // Return the result
        return randomUInt64
    }
}
