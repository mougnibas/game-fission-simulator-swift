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
    private var fissibles: [Fissible] = [ Fissible() ]

    /// Energy inside the system.
    private var energy: Energy = Energy()

    /// Number of neutrons inside the system.
    private var neutronCount: Int = 0

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
    public convenience init() {
        self.init(SystemRandomNumberGenerator())
    }

    /// Initialize the class with a given random number generator.
    ///
    /// - Parameters :
    /// - randomNumberGenerator : The given random number generator (mainly for unit tests).
    public init( _ randomNumberGenerator: RandomNumberGenerator) {
        self.randomNumberGenerator = randomNumberGenerator
        description = "BusinessService()"
    }

    /// Add a neutron into the system.
    public func addNeutron() {
        neutronCount += 1
    }

    /// Add a given number of neutrons into the system.
    ///
    /// - Parameter positiveCount : The number (positive) of neutrons to add to the system.
    ///
    /// - throws : An error if `positiveCount` is less or equals to 0.
    public func addNeutron(_ positiveCount: Int) throws {
        if positiveCount <= 0 {
            throw AppError(kind: .tooSmall, message: "Only positive integer are allowed")
        }
        neutronCount += positiveCount
    }

    /// Count the  number of neutron(s) inside the system.
    ///
    /// - Returns : The number of neutron(s) inside the system.
    public func countNeutrons() -> Int {
        return neutronCount
    }

    /// Get the actual energy in the system.
    ///
    /// - Returns : The actual energy in the system.
    public func getEnergy() -> Energy {
        return energy
    }

    /// Make something happen.
    /// This is a classic feature in game engine.
    public func tick() {

        // Increment tick counter
        _tickCount += 1

        // For each neutron, try to fiss a random fissible.
        for _ in 0..<neutronCount {

            // Decrement the neutron counter
            neutronCount -= 1

            // Get this fissible
            if let fissible = fissibles.randomElement(using: &randomNumberGenerator) {
                do {
                    // Try to fiss it
                    let fissionProduct: FissionProduct? = try fissible.tryToFiss(&randomNumberGenerator)

                    // If we have a result
                    if fissionProduct != nil {

                        // Remove the fissed fissible.
                        fissibles.remove(at: fissibles.firstIndex(of: fissible)!)

                        // Add the results to the system.
                        fissibles.append(fissionProduct!.fissibleA)
                        fissibles.append(fissionProduct!.fissibleB)
                        neutronCount += fissionProduct!.neutron.count
                        energy = try Energy(energy.value + fissionProduct!.energy.value)
                    }
                } catch {
                    // Can't fiss it because it's already too small.
                    // Just drop it from the system and "restore" the neutron.
                    // TODO OR add it into a "recycle" array, then make a bigger fissible from smaller ones.
                    fissibles.remove(at: fissibles.firstIndex(of: fissible)!)
                    neutronCount += 1
                }
            }
        }
    }
}
