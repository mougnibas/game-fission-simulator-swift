// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import XCTest
@testable import GameFissionSimulatorCore

/// Unit tests of "Mass" struct.
final class MassUnitTests: XCTestCase {

    func testDefaultConstructorHaveOnePointZeroValue() throws {

        // Arrange.
        let expected: Float = 1.0
        let mass: Mass = Mass()

        // Act.
        let actual: Float = mass.value

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithZeroPointZeroHaveThisValue() throws {

        // Arrange.
        let expected: Float = 0.0
        let mass: Mass = try Mass(0.0)

        // Act.
        let actual: Float = mass.value

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithZeroPointFiveHaveZeroValue() throws {

        // Arrange.
        let expected: Float = 0.5
        let mass: Mass = try Mass(0.5)

        // Act.
        let actual: Float = mass.value

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithOnePointZeroHaveOnePointZeroValue() throws {

        // Arrange.
        let expected: Float = 1.0
        let mass: Mass = try Mass(1.0)

        // Act.
        let actual: Float = mass.value

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testDefaultConstructorHaveThisFormated() throws {

        // Arrange.
        let expected: String = "1.00000000"
        let mass: Mass = Mass()

        // Act.
        let actual: String = mass.formated

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithZeroPointZeroHaveThisFormated() throws {

        // Arrange.
        let expected: String = "0.00000000"
        let mass: Mass = try Mass(0.0)

        // Act.
        let actual: String = mass.formated

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithZeroPointFiveHaveThisFormated() throws {

        // Arrange.
        let expected: String = "0.50000000"
        let mass: Mass = try Mass(0.5)

        // Act.
        let actual: String = mass.formated

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithOnePointZeroHaveThisFormated() throws {

        // Arrange.
        let expected: String = "1.00000000"
        let mass: Mass = try Mass(1.0)

        // Act.
        let actual: String = mass.formated

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testDefaultConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='1.00000000')"
        let mass: Mass = Mass()

        // Act.
        let actual: String = mass.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithZeroPointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='0.00000000')"
        let mass: Mass = try Mass(0.0)

        // Act.
        let actual: String = mass.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithZeroPointFiveHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='0.50000000')"
        let mass: Mass = try Mass(0.5)

        // Act.
        let actual: String = mass.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithOnePointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Mass(value='1.00000000')"
        let mass: Mass = try Mass(1.0)

        // Act.
        let actual: String = mass.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullConstructorWithOnePointOneShouldThrowError() throws {

        // Arrange, Act and Assert
        XCTAssertThrowsError(try Mass(1.1))
    }

    func testFullConstructorWithMinusZeroPointOneShouldThrowError() throws {

        // Arrange, Act and Assert
        XCTAssertThrowsError(try Mass(-0.1))
    }

    func testThoseAreEquals() throws {

        // Arrange.
        let massOne: Mass = try Mass(1.0)
        let massTwo: Mass = try Mass(1.0)

        // Act.
        let actual: Bool = massOne == massTwo

        // Assert.
        XCTAssertTrue(actual)
    }

    func testThoseAreNotEquals() throws {

        // Arrange.
        let massOne: Mass = try Mass(0.0)
        let massTwo: Mass = try Mass(1.0)

        // Act.
        let actual: Bool = massOne == massTwo

        // Assert.
        XCTAssertFalse(actual)
    }
}
