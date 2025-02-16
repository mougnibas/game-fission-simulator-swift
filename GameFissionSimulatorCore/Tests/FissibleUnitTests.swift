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
struct FissibleUnitTests {

    @Test
    func noArgConstructorHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(1.0)
        let fissible: Fissible = Fissible()

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullArgConstructorWithZeroPointZeroHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(0.0)
        let fissible: Fissible = Fissible( try Mass(0.0) )

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullArgConstructorWithZeroPointFiveHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(0.5)
        let fissible: Fissible = Fissible( try Mass(0.5) )

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullArgConstructorWithOnePointZeroHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(1.0)
        let fissible: Fissible = Fissible( try Mass(1.0) )

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func noArgConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='1.00000000')"
        let fissible: Fissible = Fissible()

        // Act.
        let actual: String = fissible.description

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullArgConstructorWithZeroPointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='0.00000000')"
        let fissible: Fissible = Fissible( try Mass(0.0) )

        // Act.
        let actual: String = fissible.description

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullArgConstructorWithZeroPointFiveHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='0.50000000')"
        let fissible: Fissible = Fissible( try Mass(0.5) )

        // Act.
        let actual: String = fissible.description

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullArgConstructorWithOnePointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='1.00000000')"
        let fissible: Fissible = Fissible( try Mass(1.0) )

        // Act.
        let actual: String = fissible.description

        // Assert.
        #expect(actual == expected)
    }
}
