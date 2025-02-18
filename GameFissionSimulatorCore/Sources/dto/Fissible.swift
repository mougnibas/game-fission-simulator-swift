// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// A fissible nucleous.
public struct Fissible: CustomStringConvertible {

    /// 20% probability of fission.
    private static let probability: Float = 0.2

    /// Energy value in case of fission.
    private static let energyValue: Float = 0.001

    /// The "mass" of the fissible element.
    public let mass: Mass

    /// A string description of the class.
    public let description: String

    /// Initialize the struct with a default mass of 1.0;
    public init() {
        self.init(Mass())
    }

    /// Initialize the struct with a given mass.
    ///
    /// - Parameters :
    ///     - mass : The mass of this fissible.
    public init( _ mass: Mass) {

        // Set the mass.
        self.mass = mass

        // Create the description.
        description = "Fissible(mass='\(mass.formated)')"
    }

    /// Try to fiss this fissible.
    ///
    /// It has a fixed probability to happen.
    /// If it happen, it will release a `FissionProduct`, containing two smaller fissible
    /// and some energy (and the original `Fissible` is destroyed).
    /// If it not, then nothing happen.
    ///
    /// - Parameter rng ; The random number generator to use.
    ///
    /// - Throws : An error if fission is a success, but result in a way too smaller fissible.
    ///
    /// - Returns : `FissionProduct`if fission is a success, `nil` otherwise.
    public func tryToFiss(_ rng: inout RandomNumberGenerator) throws -> FissionProduct? {

        // Create an empty reference.
        var fissionProduct: FissionProduct?

        // Dice roll.
        let roll: Float = Float.random(in: 0.0...1.0, using: &rng)

        // Is it a success ?
        if roll <= Fissible.probability {

            // Compute the new mass value.
            let newMassValue: Float = (mass.value / 2.0) - (Fissible.energyValue / 2.0)

            // Try to create a fission product.
            do {
                // Create the two smaller fissible and the energy released.
                fissionProduct = FissionProduct(
                    Fissible(try Mass(newMassValue)),
                    Fissible(try Mass(newMassValue)),
                    try Energy(Fissible.energyValue))
            } catch {
                // Something really go wrong here.
                throw AppError(kind: .tooSmall, message: "This will result in a fissible too small")
            }
        }

        // Return the result.
        return fissionProduct
    }

    /// Try to fiss this fissible.
    /// 
    /// It has a fixed probability to happen.
    /// If it happen, it will release a `FissionProduct`, containing two smaller fissible
    /// and some energy (and the original `Fissible` is destroyed).
    /// If it not, then nothing happen.
    ///
    /// - Throws : An error if fission is a success, but result in a way too smaller fissible.
    ///
    /// - Returns : `FissionProduct`if fission is a success, `nil` otherwise.
    public func tryToFiss() throws -> FissionProduct? {

        // Create a system RNG.
        var rng: RandomNumberGenerator = SystemRandomNumberGenerator()

        // Delegate the call.
        let fissionProduct: FissionProduct? = try tryToFiss(&rng)

        // Return the result.
        return fissionProduct
    }
}
