// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Unit tests of "Mass" struct.
struct MassUnitTests {

    @Test
    func defaultConstructorHaveOnePointZeroValue() throws {

        // Arrange.
        let expected: Float = 1.0
        let mass: Mass = Mass()

        // Act.
        let actual: Float = mass.value

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithZeroPointZeroHaveThisValue() throws {

        // Arrange.
        let expected: Float = 0.0
        let mass: Mass = try Mass(0.0)

        // Act.
        let actual: Float = mass.value

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithZeroPointFiveHaveZeroValue() throws {

        // Arrange.
        let expected: Float = 0.5
        let mass: Mass = try Mass(0.5)

        // Act.
        let actual: Float = mass.value

        // Assert.
        #expect(actual == expected)    }

    @Test
    func fullConstructorWithOnePointZeroHaveOnePointZeroValue() throws {

        // Arrange.
        let expected: Float = 1.0
        let mass: Mass = try Mass(1.0)

        // Act.
        let actual: Float = mass.value

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func defaultConstructorHaveThisFormated() throws {

        // Arrange.
        let expected: String = "1.00000000"
        let mass: Mass = Mass()

        // Act.
        let actual: String = mass.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithZeroPointZeroHaveThisFormated() throws {

        // Arrange.
        let expected: String = "0.00000000"
        let mass: Mass = try Mass(0.0)

        // Act.
        let actual: String = mass.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithZeroPointFiveHaveThisFormated() throws {

        // Arrange.
        let expected: String = "0.50000000"
        let mass: Mass = try Mass(0.5)

        // Act.
        let actual: String = mass.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithOnePointZeroHaveThisFormated() throws {

        // Arrange.
        let expected: String = "1.00000000"
        let mass: Mass = try Mass(1.0)

        // Act.
        let actual: String = mass.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func defaultConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='1.00000000')"
        let mass: Mass = Mass()

        // Act.
        let actual: String = mass.description

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithZeroPointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='0.00000000')"
        let mass: Mass = try Mass(0.0)

        // Act.
        let actual: String = mass.description

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithZeroPointFiveHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='0.50000000')"
        let mass: Mass = try Mass(0.5)

        // Act.
        let actual: String = mass.description

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithOnePointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='1.00000000')"
        let mass: Mass = try Mass(1.0)

        // Act.
        let actual: String = mass.description

        // Assert.
        #expect(actual == expected)
    }

    @Test
    func fullConstructorWithOnePointOneShouldThrowError() throws {

        // Arrange, Act and Assert
        #expect(throws: (any Error).self) { try Mass(1.1) }
    }

    @Test
    func fullConstructorWithMinusZeroPointOneShouldThrowError() throws {

        // Arrange, Act and Assert
        #expect(throws: (any Error).self) { try Mass(-0.1) }
    }

    @Test
    func thoseAreEquals() throws {

        // Arrange.
        let massOne: Mass = try Mass(1.0)
        let massTwo: Mass = try Mass(1.0)

        // Act.
        let actual: Bool = massOne == massTwo

        // Assert.
        #expect(actual == true)
    }

    @Test
    func thoseAreNotEquals() throws {

        // Arrange.
        let massOne: Mass = try Mass(0.0)
        let massTwo: Mass = try Mass(1.0)

        // Act.
        let actual: Bool = massOne == massTwo

        // Assert.
        #expect(actual == false)
    }
}
