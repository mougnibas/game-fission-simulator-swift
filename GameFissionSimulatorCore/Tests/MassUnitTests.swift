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
@Suite("Mass unit test")
struct MassUnitTests {

    @Test("Default constructor have 1.0 value")
    func defaultConstructorHaveOnePointZeroValue() throws {

        // Arrange.
        let expected: Float = 1.0
        let mass: Mass = Mass()

        // Act.
        let actual: Float = mass.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this given value have this value", arguments: [0.0, 0.5, 1.0])
    func fullConstructorWithZeroPointZeroHaveThisValue(_ value: Float) throws {

        // Arrange.
        let expected: Float = value
        let mass: Mass = try Mass(value)

        // Act.
        let actual: Float = mass.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("Default constructor have this formated")
    func defaultConstructorHaveThisFormated() throws {

        // Arrange.
        let expected: String = "1.00000000"
        let mass: Mass = Mass()

        // Act.
        let actual: String = mass.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with those values have those formated", arguments: zip(
        [0.0, 0.5, 1.0],
        ["0.00000000", "0.50000000", "1.00000000"]))
    func fullConstructorWithThisValueHaveThisFormated(_ value: Float, _ expected: String) throws {

        // Arrange.
        let mass: Mass = try Mass(value)

        // Act.
        let actual: String = mass.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test("Default constructor have this description")
    func defaultConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='1.00000000')"
        let mass: Mass = Mass()

        // Act.
        let actual: String = mass.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this values have this description", arguments: zip(
        [0.0, 0.5, 1.0],
        ["Mass(value='0.00000000')", "Mass(value='0.50000000')", "Mass(value='1.00000000')"]))
    func fullConstructorWithThisValuesHaveThisDescription(_ value: Float, _ expected: String) throws {

        // Arrange.
        let mass: Mass = try Mass(value)

        // Act.
        let actual: String = mass.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this values should throw error", arguments: [1.1, -0.1])
    func fullConstructorWithThisValueShouldThrowError(_ value: Float) throws {

        // Arrange, Act and Assert
        #expect(throws: (any Error).self) { try Mass(value) }
    }

    @Test("Equals", arguments: zip(
        [try Mass(0.0), try Mass(0.5), try Mass(1.0)],
        [try Mass(0.0), try Mass(0.5), try Mass(1.0)]))
    func thoseAreEquals(_ massOne: Mass, _ massTwo: Mass) throws {

        // Act.
        let actual: Bool = massOne == massTwo

        // Assert.
        #expect(actual == true)
    }

    @Test("Not equals", arguments: zip(
        [try Mass(0.0), try Mass(0.2), try Mass(1.0)],
        [try Mass(0.1), try Mass(0.3), try Mass(0.9)]))
    func thoseAreNotEquals(_ massOne: Mass, _ massTwo: Mass) throws {

        // Act.
        let actual: Bool = massOne == massTwo

        // Assert.
        #expect(actual == false)
    }
}
