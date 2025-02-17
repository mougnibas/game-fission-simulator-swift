// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// Business service class.
public class BusinessService: CustomStringConvertible {

    /// Random number generator to use.
    private var randomNumberGenerator: RandomNumberGenerator

    /// A string description of the class.
    public var description: String

    /// All fissibles of the class.
    private var fissibles: [Fissible] = []

    /// Public read only counter of fissibles.
    public var fissibleCount: Int {
        fissibles.count
    }

    /// Internal tick counter.
    private var _tickCount: Int = 0

    /// Public read only counter of ticks.
    public var tickCount: Int {
        _tickCount
    }

    /// Initialize the class with a default random number generator.
    public init() {
        randomNumberGenerator = SystemRandomNumberGenerator()
        description = "BusinessService()"
    }

    /// Initialize the class with a given random number generator.
    ///
    /// - Parameters :
    ///   - randomNumberGenerator : The given random number generator (mainly for unit tests).
    public init( _ randomNumberGenerator: RandomNumberGenerator) {
        self.randomNumberGenerator = randomNumberGenerator
        description = "BusinessService()"
    }

    /// Make something happen.
    /// This is a classic feature in game engine.
    public func tick() {
        _tickCount += 1
    }
}
