// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation

/// Business service actor.
public actor BusinessService: CustomStringConvertible {

    /// Private random number generator of the system.
    private var randomNumberGenerator: RandomNumberGenerator

    /// Private array of fissibles of the system.
    private var fissibles: [Fissible]

    /// Public read-only Energy of the system (write is private).
    private(set) var energy: Energy = Energy()

    /// Public read-only number of neutrons of the system (write is private).
    private(set) var neutronCount: Int = 0

    /// Public read-only counter of ticks of the system (write is private).
    private(set) var tickCount: Int = 0

    /// Public read-only control bar of the system (write is private).
    private(set) var controlBar: ControlBar = ControlBar()

    /// Public read-only (computed) counter of fissibles of the system.
    public var fissibleCount: Int {
        fissibles.count
    }

    /// A public string description of the class.
    public let description: String

    /// Initialize the class with a given random number generator.
    ///
    /// - Parameters :
    /// - randomNumberGenerator : The given random number generator (mainly for unit tests).
    ///                           Default will be a ``SystemRandomNumberGenerator``.
    /// - numberOfFissibles : The number of fissible inside the system (default will be 0).
    public init( _ randomNumberGenerator: RandomNumberGenerator = SystemRandomNumberGenerator(),
                 _ numberOfFissibles: Int = 0) {

        // Set RNG
        self.randomNumberGenerator = randomNumberGenerator

        // Set fissibles
        fissibles = Array(repeating: Fissible(), count: numberOfFissibles)

        // Set description
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
    public func addNeutron(_ positiveCount: Int) throws(TooSmallError) {
        guard positiveCount > 0 else {
            throw TooSmallError("Only positive integer are allowed")
        }
        neutronCount += positiveCount
    }

    /// Pull the control bar.
    public func pullControlBar() {
        controlBar.pull()
    }

    /// Pull the control bar a given amount of time.
    ///
    /// - Parameter numberOfPush : The number of pull to do (must be between 1 and 100).
    ///
    /// - Throws ``InvalidInputError`` If the numberOfPull is not between 1 and 100.
    public func pullControlBar(_ numberOfPull: Int) throws(InvalidInputError) {

        // Verify parameter.
        guard numberOfPull >= 1 && numberOfPull <= 100 else {
            throw InvalidInputError("Only positive integer are allowed (get '\(numberOfPull)'")
        }

        // Push the control bar a given number of times.
        for _ in 0..<numberOfPull {
            pullControlBar()
        }
    }

    /// Push the control bar.
    public func pushControlBar() {
        controlBar.push()
    }

    /// Push the control bar a given amount of time.
    ///
    /// - Parameter numberOfPush : The number of push to do (must be between 1 and 100).
    ///
    /// - Throws ``InvalidInputError`` If the numberOfPush is not between 1 and 100.
    public func pushControlBar(_ numberOfPush: Int) throws(InvalidInputError) {

        // Verify parameter.
        guard numberOfPush >= 1 && numberOfPush <= 100 else {
            throw InvalidInputError("Only positive integer are allowed (get '\(numberOfPush)'")
        }

        // Push the control bar a given number of times.
        for _ in 0..<numberOfPush {
            pushControlBar()
        }
    }

    /// Make something happen.
    /// This is a classic feature in game engine.
    public func tick() {

        // Increment tick counter.
        tickCount += 1

        // Filter neutrons.
        neutronCount = controlBar.filter(neutronCount)

        // New neutron count, updated at the end of tick
        var newNeutronCount: Int = 0

        // For each neutron, try to fiss a random fissible.
        for _ in 0..<neutronCount {

            // Decrement the neutron counter.
            // Every neutrons inside the system is consumed.
            // Newly created neutron will be used the next time ``tick()`` is called.
            neutronCount -= 1

            // Get this fissible
            if let fissible = fissibles.randomElement(using: &randomNumberGenerator) {

                // Try to fiss it
                let fissionProduct: FissionProduct? = fissible.tryToFiss(&randomNumberGenerator)

                // If we have a result
                if fissionProduct != nil {

                    // Remove the fissed fissible.
                    fissibles.remove(at: fissibles.firstIndex(of: fissible)!)

                    // Add the results to the system :
                    // - More neutrons
                    // - More energy
                    newNeutronCount += fissionProduct!.neutronCount
                    energy = Energy(unsafeValue: energy.value + fissionProduct!.energy.value)
                }
            }
        }

        // Update neutron count
        neutronCount = newNeutronCount
    }
}
