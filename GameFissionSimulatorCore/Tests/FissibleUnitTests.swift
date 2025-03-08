// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Unit tests of "Fissible" struct.
@Suite("Fissible unit test")
struct FissibleUnitTests {

    @Test("No arg constructor have this mass")
    func noArgConstructorHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(1.0)
        let fissible: Fissible = Fissible()

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this mass have this mass", arguments: [try Mass(0.0), try Mass(0.5), try Mass(1.0)])
    func fullArgConstructorWithThisMassHaveThisMass(_ expected: Mass) throws {

        // Arrange.
        let fissible: Fissible = Fissible( expected )

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        #expect(actual == expected)
    }

    @Test("No arg constructor have this description")
    func noArgConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='1.00000000')"
        let fissible: Fissible = Fissible()

        // Act.
        let actual: String = fissible.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this mass have this description", arguments: zip(
        [try Mass(0.0), try Mass(0.5), try Mass(1.0)],
        ["Fissible(mass='0.00000000')", "Fissible(mass='0.50000000')", "Fissible(mass='1.00000000')"]))
    func fullArgConstructorWithMassHaveThisDescription(_ mass: Mass, _ description: String) throws {

        // Arrange.
        let expected: String = description
        let fissible: Fissible = Fissible(mass)

        // Act.
        let actual: String = fissible.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("This should fiss")
    func tryToFiss() throws {

        // Arrange.
        let fissible: Fissible = try Fissible(Mass(1.0))
        var rng: RandomNumberGenerator = FixedRandomNumberGenerator()

        // Act.
        let actual: FissionProduct? = try fissible.tryToFiss(&rng)

        // Assert.
        #expect(actual != nil)
    }

    @Test("Using a real RNG, we should get arround 20% of hits")
    func shouldBeArround20PercentOfHit() throws {

        // Arrange.
        let fissible: Fissible = try Fissible(Mass(1.0))
        var numberOfFission: Int = 0
        let numberOfTryout: Int = 1_000_000

        // Act.
        for _ in 1..<numberOfTryout where try fissible.tryToFiss() != nil {
            numberOfFission += 1
        }

        // Assert.
        #expect(numberOfFission >= 199_000 && numberOfFission <= 201_000)
    }

    @Test("Reused RNG should change fissible result", arguments: zip(
        [0,
         1,
         10,
         100],
        [true,
         false,
         true,
         false]))
    func willFiss(numberOfNextCalls: Int, expected: Bool) async throws {

        // Arrange.
        var rng: RandomNumberGenerator = FixedRandomNumberGenerator()
        for _ in 0..<numberOfNextCalls {
            _ = rng.next()
        }
        let fissible: Fissible = try Fissible(Mass(1.0))

        // Act.
        let actual: Bool = try fissible.tryToFiss(&rng) != nil

        // Assert.
        #expect(actual == expected)
    }

    @Test("Try to fiss a too small fissible should result in an error")
    func shouldThrowAnError() throws {

        // Arrange.
        var rng: RandomNumberGenerator = FixedRandomNumberGenerator()
        let fissible: Fissible = Fissible(try Mass(Float.leastNonzeroMagnitude))

        // Act and Assert
        #expect(throws: (any Error).self) { try fissible.tryToFiss(&rng) }
    }
}
