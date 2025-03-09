// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import Testing
@testable import GameFissionSimulatorCore

/// Unit tests of ``ControlBar`` struct.
@Suite("ControlBar unit test")
struct ControlBarUnitTests {

    @Test("constructor interal")
    func useInternalConstructor() throws {

        // Arrange.
        let expected: Int = -100
        let controlBar: ControlBar = .init(unsafeValue: expected)

        // Act.
        let actual: Int = controlBar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor default")
    func useDefaultConstructor() throws {

        // Arrange.
        let expected: Int = 0
        let controlBar: ControlBar = .init()

        // Act.
        let actual: Int = controlBar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with correct value")
    func useRegularConstructorWithCorrectValue() throws {

        // Arrange.
        let expected: Int = 50
        let controlBar: ControlBar = try .init(expected)

        // Act.
        let actual: Int = controlBar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with bottom limit value")
    func useRegularConstructorWithCorrectBottomLimitValue() throws {

        // Arrange.
        let expected: Int = 0
        let controlBar: ControlBar = try .init(expected)

        // Act.
        let actual: Int = controlBar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with upper limit value")
    func useRegularConstructorWithCorrectTopLimitValue() throws {

        // Arrange.
        let expected: Int = 100
        let controlBar: ControlBar = try .init(expected)

        // Act.
        let actual: Int = controlBar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with incorrect value")
    func useRegularConstructorWithIncorrectValue() throws {

        // Arrange.
        let expected: Int = -1

        // Act and Assert.
        #expect(throws: (InvalidInputError).self) { try ControlBar(expected) }
    }

    @Test("constructor with incorrect values", arguments: [-1, 101, -2, 102, 300, -1_000])
    func useRegularConstructorWithIncorrectValues(value: Int) throws {

        // Act and Assert.
        #expect(throws: (InvalidInputError).self) { try ControlBar(value) }
    }

    @Test("constructor default, then call push, then compare value")
    func useDefaultConstructorThenCallPushThenCompareValue() throws {

        // Arrange.
        let expected: Int = 1
        var bar: ControlBar = .init()

        // Act.
        bar.push()
        let actual: Int = bar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with upper limit value, then call pull, then compare value")
    func useRegularConstructorWithCorrectTopLimitValueThenCallPullThenCompareValue() throws {

        // Arrange.
        let expected: Int = 99
        var bar: ControlBar = try .init(100)

        // Act.
        bar.pull()
        let actual: Int = bar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with correct values, then call push, then compare values", arguments: zip(
        [0, 50, 20],
        [1, 51, 21]))
    func useRegularConstructorWithCorrectValuesThenCallPushThenCompareValues(initial: Int, expected: Int) throws {

        // Arrange.
        var bar: ControlBar = try .init(initial)

        // Act.
        bar.push()
        let actual: Int = bar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with correct values, then call pull, then compare values", arguments: zip(
        [100, 50, 20],
        [99, 49, 19]))
    func useRegularConstructorWithCorrectValuesThenCallPullThenCompareValues(initial: Int, expected: Int) throws {

        // Arrange.
        var bar: ControlBar = try .init(initial)

        // Act.
        bar.pull()
        let actual: Int = bar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with bottom limit value, then call pull, then it should be 0")
    func useRegularConstructorWithBottomLimitValueThenCallPullThenItShouldBeZero() throws {

        // Arrange.
        let expected: Int = 0
        var bar: ControlBar = try .init(0)

        // Act.
        bar.pull()
        let actual: Int = bar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with upper limit value, then call push, then it should be 100")
    func useRegularConstructorWithUpperLimitValueThenCallPushThenItShouldBeHundred() throws {

        // Arrange.
        let expected: Int = 100
        var bar: ControlBar = try .init(100)

        // Act.
        bar.push()
        let actual: Int = bar.value

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor default, then description should be this")
    func useDefaultConstructorThenDescriptionShouldBeThis() throws {

        // Arrange.
        let expected: String = "ControlBar(value='000')"
        let bar: ControlBar = .init()

        // Act.
        let actual: String = bar.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with correct values, then description should be this", arguments: zip(
        [0, 100, 50],
        ["ControlBar(value='000')",
         "ControlBar(value='100')",
         "ControlBar(value='050')"]))
    func useConstructorWithCorrectValuesThenDescriptionsShouldBeThis(initial: Int, expected: String) throws {

        // Arrange.
        let bar: ControlBar = try .init(initial)

        // Act.
        let actual: String = bar.description

        // Assert.
        #expect(actual == expected)
    }

    @Test("constructor with correct values, then compare should be equals", arguments: zip(
        [0, 100, 50, 75, 25, 33],
        [0, 100, 50, 75, 25, 33]))
    func useConstructorWithCorrectValuesThenCompareShouldBeEquals(leftValue: Int, rightValue: Int) throws {

        // Arrange
        let leftControlBar: ControlBar = try .init(leftValue)
        let rightControlBar: ControlBar = try .init(rightValue)

        // Act and assert.
        #expect(leftControlBar == rightControlBar)
    }

    @Test("constructor with correct values, then compare should not be equals", arguments: zip(
        [0, 100, 50, 75, 25, 33],
        [1, 099, 48, 76, 22, 66]))
    func useConstructorWithCorrectValuesThenCompareShouldNotBeEquals(leftValue: Int, rightValue: Int) throws {

        // Arrange
        let leftControlBar: ControlBar = try .init(leftValue)
        let rightControlBar: ControlBar = try .init(rightValue)

        // Act and assert.
        #expect(leftControlBar != rightControlBar)
    }
}
