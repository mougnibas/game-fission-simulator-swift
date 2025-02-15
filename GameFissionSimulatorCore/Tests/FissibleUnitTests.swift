// GNU AFFERO GENERAL PUBLIC LICENSE
// Version 3, 19 November 2007
//
// Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
// Everyone is permitted to copy and distribute verbatim copies
// of this license document, but changing it is not allowed.

import Foundation
import XCTest
@testable import GameFissionSimulatorCore

/// Unit tests of "Fissible" struct.
final class FissibleUnitTests: XCTestCase {

    func testNoArgConstructorHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(1.0)
        let fissible: Fissible = Fissible()

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullArgConstructorWithZeroPointZeroHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(0.0)
        let fissible: Fissible = Fissible( try Mass(0.0) )

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullArgConstructorWithZeroPointFiveHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(0.5)
        let fissible: Fissible = Fissible( try Mass(0.5) )

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullArgConstructorWithOnePointZeroHaveThisMass() throws {

        // Arrange.
        let expected: Mass = try Mass(1.0)
        let fissible: Fissible = Fissible( try Mass(1.0) )

        // Act.
        let actual: Mass = fissible.mass

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testNoArgConstructorHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='1.00000000')"
        let fissible: Fissible = Fissible()

        // Act.
        let actual: String = fissible.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullArgConstructorWithZeroPointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='0.00000000')"
        let fissible: Fissible = Fissible( try Mass(0.0) )

        // Act.
        let actual: String = fissible.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullArgConstructorWithZeroPointFiveHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='0.50000000')"
        let fissible: Fissible = Fissible( try Mass(0.5) )

        // Act.
        let actual: String = fissible.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }

    func testFullArgConstructorWithOnePointZeroHaveThisDescription() throws {

        // Arrange.
        let expected: String = "Fissible(mass='1.00000000')"
        let fissible: Fissible = Fissible( try Mass(1.0) )

        // Act.
        let actual: String = fissible.description

        // Assert.
        XCTAssertEqual(actual, expected)
    }
}
