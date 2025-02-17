// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// A fissible nucleous.
public struct Fissible: CustomStringConvertible {

    /// The "mass" of the fissible element.
    public let mass: Mass

    /// A string description of the class.
    public let description: String

    /// 20% probability of fission.
    private let probability: Float = 0.2

    /// Initialize the struct with a default mass of 1.0;
    public init() {
        self.init(Mass())
    }

    /// Initialize the struct with a given mass.
    ///
    /// - Parameters :
    ///     - mass : The mass of this fissible.
    public init( _ mass: Mass) {

        // Set the mass
        self.mass = mass

        // Create the description
        description = "Fissible(mass='\(mass.formated)')"
    }

    /// Will this fissible be fissed ?
    /// There is a fixed percentage of probability.
    ///
    /// - Parameters :
    ///     - rng : Random number generator to use.
    public func willFiss(_ rng: inout RandomNumberGenerator) -> Bool {

        // Dice roll
        let roll: Float = Float.random(in: 0.0...1.0, using: &rng)

        // Is it a success ?
        let isSuccess: Bool = roll < probability

        // Return the result
        return isSuccess
    }

    /// Will this fissible be fissed ?
    /// There is a fixed percentage of probability.
    public func willFiss() -> Bool {

        // Create a system RNG.
        var rng: RandomNumberGenerator = SystemRandomNumberGenerator()

        // Delegate the call
        let isSuccess = willFiss(&rng)

        // Return the result
        return isSuccess
    }
}
