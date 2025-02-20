// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Unit tests of "Energy" struct.
@Suite("Energy unit test")
struct EnergyUnitTests {

    @Test("Default constructor have 0.0 value")
    func defaultConstructorHaveOnePointZeroValue() throws {

        // Arrange.
        let expected: Float = 0.0
        let energy: Energy = Energy()

        // Act.
        let actual: Float = energy.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this given value have this value", arguments: [0.0, 0.5, 1.0])
    func fullConstructorWithZeroPointZeroHaveThisValue(_ value: Float) throws {

        // Arrange.
        let expected: Float = value
        let energy: Energy = try Energy(value)

        // Act.
        let actual: Float = energy.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("Default constructor have this formated")
    func defaultConstructorHaveThisFormated() throws {

        // Arrange.
        let expected: String = "0.00000000"
        let energy: Energy = Energy()

        // Act.
        let actual: String = energy.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with those values have those formated", arguments: zip(
        [0.0, 0.5, 1.0],
        ["0.00000000", "0.50000000", "1.00000000"]))
    func fullConstructorWithThisValueHaveThisFormated(_ value: Float, _ expected: String) throws {

        // Arrange.
        let energy: Energy = try Energy(value)

        // Act.
        let actual: String = energy.formated

        // Assert.
        #expect(actual == expected)
    }

    @Test("Default constructor have this description")
    func defaultConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Energy(value='0.00000000')"
        let energy: Energy = Energy()

        // Act.
        let actual: String = energy.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this values have this description", arguments: zip(
        [0.0, 0.5, 1.0],
        ["Energy(value='0.00000000')", "Energy(value='0.50000000')", "Energy(value='1.00000000')"]))
    func fullConstructorWithThisValuesHaveThisDescription(_ value: Float, _ expected: String) throws {

        // Arrange.
        let energy: Energy = try Energy(value)

        // Act.
        let actual: String = energy.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("Full constructor with this values should throw error", arguments: [1.1, -0.1])
    func fullConstructorWithThisValueShouldThrowError(_ value: Float) throws {

        // Arrange, Act and Assert
        #expect(throws: (any Error).self) { try Energy(value) }
    }

    @Test("Equals", arguments: zip(
        [try Energy(0.0), try Energy(0.5), try Energy(1.0)],
        [try Energy(0.0), try Energy(0.5), try Energy(1.0)]))
    func thoseAreEquals(_ energyOne: Energy, _ energyTwo: Energy) throws {

        // Act.
        let actual: Bool = energyOne == energyTwo

        // Assert.
        #expect(actual == true)
    }

    @Test("Not equals", arguments: zip(
        [try Energy(0.0), try Energy(0.2), try Energy(1.0)],
        [try Energy(0.1), try Energy(0.3), try Energy(0.9)]))
    func thoseAreNotEquals(_ energyOne: Energy, _ energyTwo: Energy) throws {

        // Act.
        let actual: Bool = energyOne != energyTwo

        // Assert.
        #expect(actual == true)
    }
}
